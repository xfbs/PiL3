-- g: the graph
-- s: the name of the starting point
-- e: the name of the endpoint

dofile("graph.lua")

function dijkstra(g, s, e)
	local unvisited={}
	local dist={}
	local prev={}
	local start=g[s]
	local lst=g[e]
	local current=start

	for i, j in pairs(g) do unvisited[j]=true end
	for i, j in pairs(g) do dist[j]=math.huge end

	dist[start]=0
	while current~=lst do
		for to, l in pairs(current.adj) do
			if unvisited[to]==true then
				local ndist=dist[current]+l
				if dist[to]>ndist then
					dist[to]=ndist
					prev[to]=current
				end
			end
		end

		unvisited[current]=false
		current=lst
		for i, j in pairs(unvisited) do
			if j==true and dist[i]<dist[current] then
				current=i
			end
		end
	end

	return prev
end
