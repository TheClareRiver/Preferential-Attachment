 ______     ______     ______     _____        __    __     ______    
/\  == \   /\  ___\   /\  __ \   /\  __-.     /\ "-./  \   /\  ___\   
\ \  __<   \ \  __\   \ \  __ \  \ \ \/\ \    \ \ \-./\ \  \ \  __\   
 \ \_\ \_\  \ \_____\  \ \_\ \_\  \ \____-     \ \_\ \ \_\  \ \_____\ 
  \/_/ /_/   \/_____/   \/_/\/_/   \/____/      \/_/  \/_/   \/_____/ 

PROGRAMMING ASSIGNMENT 1 (PREFERENTIAL-ATTACHMENT)
A Simulation of Preferential-Attachment Graphs
------
Friday, 27 February 2015

Coded by:	Clarence Johnson, III '15	cjohnson@bowdoin.edu			
										proexodus@gmail.com
------

D E S C R I P T I O N :

This program, written in Ruby, implements and generates a preferential attachment graph parameterized by M, the number of connections a newborn node forms with the already-existing nodes, as well as the number of nodes, n. 

This program creates a n x n matrix that holds the adjacency matrix. All elements are initialized to be 0, meaning there are no connections. An array is also created to store the degree of each node, also initialized to 0. The first M nodes are then connected to one another. For example, if M =3, then a triangle is formed between nodes 0, 1, and 2. Their degrees are updated accordingly. 

For each of the remaining nodes that were not initially connected and until every remaining node has a degree of M, each node will connect to a pre-exisiting node with a probability proportional to that pre-existing node's degree. If an edge is created, the adjacency matrix as well as the degrees of both nodes that are connected are updated. 

H O W   T O   R U N :

To run the program, on the command line enter:
						1. "ruby Preferential-Attachment.rb"
						2. The number of nodes in the graph (n)
						3. The number of nodes that need to be connected intially (M)

Example command line input: ruby Preferential-Attachment.rb 100 5

K N O W N   B U G S :

[2/27/15]
	1. No known bugs...
