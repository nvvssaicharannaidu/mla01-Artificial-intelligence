# Uniform Cost Search

import heapq

class Node:
    def __init__(self, state, parent=None, cost=0):
        self.state = state
        self.parent = parent
        self.cost = cost

    def __lt__(self, other):
        return self.cost < other.cost

def uniform_cost_search(start, goal, graph):
    priority_queue = []
    heapq.heappush(priority_queue, Node(start, cost=0))
    explored = set()

    while priority_queue:
        current_node = heapq.heappop(priority_queue)

        if current_node.state in explored:
            continue

        if current_node.state == goal:
            return current_node

        explored.add(current_node.state)

        for neighbor, cost in graph[current_node.state].items():
            if neighbor not in explored:
                new_cost = current_node.cost + cost
                child_node = Node(neighbor, parent=current_node, cost=new_cost)
                heapq.heappush(priority_queue, child_node)

    return None

# Example graph
graph = {
    'A': {'B': 1, 'C': 4},
    'B': {'A': 1, 'D': 2, 'E': 5},
    'C': {'A': 4, 'E': 1},
    'D': {'B': 2, 'E': 3},
    'E': {'B': 5, 'C': 1, 'D': 3}
}

# Running the uniform cost search
result = uniform_cost_search('A', 'E', graph)
if result:
    path = []
    while result:
        path.append(result.state)
        result = result.parent
    path.reverse()
    print("Path found:", path)
else:
    print("No path found.")
