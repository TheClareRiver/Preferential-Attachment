#Preferential-Attachment 
#All Code by Clarence Johnson, III
#Social & Economic Networks 
#February 27, 2015

#This program generates preferential attachment graphs parameterized by M, the number
#of connections a newborn node forms with the already-existing nodes, and n, the total number of
#nodes in the graph

def printInfo(adjacencyMatrix, degreeArray)#print the details of the matrix and its degrees
	puts"M A T R I X :"
	puts adjacencyMatrix.to_a.map(&:inspect) #print out the adjacency matrix *adapted from stack overflow*
	puts "D E G R E E S   OF   N O D E S :"
	puts degreeArray.inspect #print out all degrees in the array
	puts "\n"
end

def connectTwoNodes(adjacencyMatrix,degreeArray,x,y) #establishes a connection of a node with another node
	if x != y #if the connection hasn't already been established
		adjacencyMatrix[x][y] = 1
		adjacencyMatrix[y][x] = 1
		degreeArray[x] += 1
		degreeArray[y] += 1
	end
end

def isConnected(adjacencyMatrix,x,y) #checks if two nodes are connected
	if adjacencyMatrix[x][y] == 1 #if there is a connection in the adjacency matrix
		return true
	else #if there isn't a connection in the adjacency matrix
		return false
	end
end

def initializeMNodes(adjacencyMatrix,degreeArray,m)#connects all the nodes together
	m -= 1 
	for x in 0..m #for every node that needs to be connected
		for y in 0..m #for every other node
			if !isConnected(adjacencyMatrix,x,y) #if the node is not already connected
				connectTwoNodes(adjacencyMatrix,degreeArray,x,y) #connect the nodes
			end
		end
	end
end

def connectRemainingNodes(adjacencyMatrix,degreeArray,n,m)
	m -= 1 #used to take care of the issue of indices starting at 0 in program languages...
	for x in m..n-1 #for every node that's not connected yet
		while degreeArray[x] != m #until node has a degree of m
			p = rand(0.0...1.0) #generate random number
			totalP = 0.0
			for y in 0..x-1 #explore all nodes before the current node
				totalDegreeArray = degreeArray.inject{|sum,x| sum + x } #summation of all degrees of all nodes
				totalP += degreeArray[y]/totalDegreeArray #generate the probability
				if p <= totalP and !isConnected(adjacencyMatrix,x,y) #if the probability is good and the nodes are not already connected
					connectTwoNodes(adjacencyMatrix,degreeArray,x,y)
					break
				end
			end
		end
	end
end

puts "\nPreferential-Attachment\nBy Clarence Johnson, III '15\n----------------------------"

n = ARGV[0].to_i #number of nodes, converted from string to int
m = ARGV[1].to_i #number of connections a newborn node forms with the already existing nodes. 
if (n.is_a? Integer and n != 0 and m.is_a? Integer and m != 0 and n >= m)#if n is an int and not 0
	puts "NODES ENTERED: #{n}"
	puts "NODES TO CONNECT: #{m}\n----------------------------\n\n"
else
	abort("Sorry. Invalid arguments...\nPlease enter the number of nodes (n) you would like the matrix to have and the number of nodes (M) that you would like to initially connect.")
end

matrix = Array.new(n) {Array.new(n,0)} #Create new n x n adjacency matrix and intialized to all zeros
degrees = Array.new(n,0.0) #Create new list of degrees. Set all values to zero

initializeMNodes(matrix,degrees,m) #connect the nodes that need to be connected to one another
connectRemainingNodes(matrix,degrees,n,m+1) #connect the remaining nodes
printInfo(matrix,degrees) #print the resulting matrix
