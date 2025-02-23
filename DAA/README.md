# Kruskal's Algorithm (Minimum Spanning Tree)

## 📌 Overview

Kruskal's Algorithm is a **greedy algorithm** used to find the **Minimum Spanning Tree (MST)** of a weighted, undirected graph. It follows these steps:

1. **Sort all edges** in ascending order based on weight.
2. **Iterate through sorted edges** and check if adding an edge forms a cycle.
3. **Use Disjoint Set (Union-Find)** to detect cycles.
4. **Include the edge** in the MST if it does not form a cycle.
5. **Stop when MST contains V-1 edges** (where V is the number of vertices).

## 🛠️ Folder Structure

```
Kruskal_Algorithm/
│── src/
│   ├── Kruskal.java        # Main class containing Kruskal's Algorithm
│   ├── Edge.java           # Edge class implementing Comparable for sorting
│   ├── DisjointSet.java    # Disjoint Set (Union-Find) for cycle detection

```

## 📝 Code Implementation

### **1️⃣ Edge.java** (Stores edge details and sorts edges by weight)

```java
class Edge implements Comparable<Edge> {
    int src, dest, weight;

    public Edge(int src, int dest, int weight) {
        this.src = src;
        this.dest = dest;
        this.weight = weight;
    }

    @Override
    public int compareTo(Edge other) {
        return this.weight - other.weight;
    }
}
```

### **2️⃣ DisjointSet.java** (Union-Find for cycle detection)

```java
class DisjointSet {
    private int[] parent, rank;

    public DisjointSet(int n) {
        parent = new int[n];
        rank = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
            rank[i] = 0;
        }
    }

    public int find(int node) {
        if (parent[node] != node) {
            parent[node] = find(parent[node]); // Path compression
        }
        return parent[node];
    }

    public void union(int u, int v) {
        int rootU = find(u);
        int rootV = find(v);

        if (rootU != rootV) {
            if (rank[rootU] > rank[rootV]) {
                parent[rootV] = rootU;
            } else if (rank[rootU] < rank[rootV]) {
                parent[rootU] = rootV;
            } else {
                parent[rootV] = rootU;
                rank[rootU]++;
            }
        }
    }
}
```

### **3️⃣ Kruskal.java** (Main Algorithm Implementation)

```java
import java.util.*;

class Kruskal {
    public static List<Edge> kruskalMST(List<Edge> edges, int V) {
        List<Edge> mst = new ArrayList<>();
        Collections.sort(edges);
        DisjointSet ds = new DisjointSet(V);

        for (Edge edge : edges) {
            int rootU = ds.find(edge.src);
            int rootV = ds.find(edge.dest);

            if (rootU != rootV) { // No cycle formed
                mst.add(edge);
                ds.union(rootU, rootV);
                if (mst.size() == V - 1) break;
            }
        }
        return mst;
    }

    public static void main(String[] args) {
        int V = 4;
        List<Edge> edges = new ArrayList<>();
        edges.add(new Edge(0, 1, 10));
        edges.add(new Edge(0, 2, 6));
        edges.add(new Edge(0, 3, 5));
        edges.add(new Edge(1, 3, 15));
        edges.add(new Edge(2, 3, 4));

        List<Edge> mst = kruskalMST(edges, V);
        for (Edge edge : mst) {
            System.out.println(edge.src + " - " + edge.dest + " : " + edge.weight);
        }
    }
}
```

## 📌 Explanation of the Flow

1. **Edge Class**: Stores `src`, `dest`, `weight` and implements `Comparable` for sorting.
2. **DisjointSet Class**: Implements **Union-Find with path compression**.
3. **Kruskal Algorithm**:
   - Sorts all edges.
   - Iterates through edges and **checks for cycles** using Disjoint Set.
   - Uses `find()` to get root parents of `src` and `dest`.
   - Uses `union()` to merge components.
   - **Stops when MST contains V-1 edges.**

## 📊 Output Example

```
2 - 3 : 4
0 - 3 : 5
0 - 1 : 10
```

## 🏆 Time Complexity

- **Sorting Edges**: `O(E log E)`
- **Find & Union Operations**: `O(E log V)` (using path compression & union by rank)
- **Total Complexity**: `O(E log E) ≈ O(E log V)`

---

### **Kruskal's Algorithm - Code Flow Explanation**

#### **1. Creating the Kruskal Class and Main Function**

1.1 - First, create a list of edges that stores edge details like `src`, `dest`, and `weight`.

- The user provides input for `src` (starting node), `dest` (ending node), and `weight` (cost of edge).

  1.2 - The `Edge` class implements `Comparable<Edge>`, allowing the edges to be sorted in ascending order based on their weight.

  1.3 - Override the `compareTo()` method to define how edges should be sorted.

- Sorting is required because Kruskal’s algorithm works by processing edges in increasing order of weight.

  1.4 - Create a list named `mst` to store the Minimum Spanning Tree (MST) edges.

- This list is initialized by calling the `kruskalMST()` method, which takes two parameters:

  - `edges` (list of edges)
  - `V` (number of vertices).

  1.5 - Finally, call the `kruskalMST()` method to compute the MST.

---

#### **2. Kruskal's Algorithm Method (`kruskalMST`)**

2.1 - The method returns a `List<Edge>` because, after execution, it will return the list of edges forming the MST.

2.2 - **Sorting Edges**:

- Use `Collections.sort(edges)` to sort all edges in ascending order based on weight.
- This ensures that we process the lowest-weight edges first, as required by Kruskal’s algorithm.

  2.3 - **Creating a Disjoint Set**:

- Create a `DisjointSet` object named `ds`.
- This object helps in detecting cycles and merging sets efficiently.
- It is initialized with `V`, meaning that initially, each vertex is its own parent.

---

#### **3. Disjoint Set Constructor (`DisjointSet`)**

**3.1 - Parent Array Initialization:**

- The `parent` array stores the representative parent of each node.
- Initially, every node is its own parent:
  ```java
  parent = [0, 1, 2, 3, 4]
  ```
  This means node `0` is its own parent, `1` is its own parent, and so on.

**3.2 - Rank Array Initialization:**

- The `rank` array is initialized with zeros:
  ```java
  rank = [0, 0, 0, 0, 0]
  ```
  - This helps in keeping the trees balanced during union operations.
  - Higher-ranked trees become the parent during the union operation.

**3.3 - Parent Array Update:**

- A loop runs to set `parent[i] = i`, ensuring each node starts as its own parent.

---

#### **4. Find Function (`find(int node)`)**

- The `find` function determines the representative parent of a node.
- If a node is not its own parent, the function recursively finds its parent.
- **Path Compression Optimization**:
  - Instead of traversing the tree every time, we directly attach the node to its root parent to speed up future queries.
  ```java
  parent[node] = find(parent[node]); // Path compression
  ```

---

#### **5. Union Function (`union(int u, int v)`)**

- The `union` function connects two sets by updating their parents.
- **Steps:**
  1. Find the root parent of `u` (`rootU = find(u)`).
  2. Find the root parent of `v` (`rootV = find(v)`).
  3. Compare `rootU` and `rootV`:
     - If they are the same, it means `u` and `v` are already in the same set, so we do nothing (to avoid cycles).
     - Otherwise, attach the smaller tree under the larger tree (based on rank) to keep the tree balanced.
  4. If ranks are equal, increase the rank of the new root.

---

#### **6. Processing the Edges in the `kruskalMST()` Method**

6.1 - Iterate through the sorted edge list using a `for` loop.

- For each edge, find the parents of `src` and `dest` using the `find()` function.
- If they have different parents, it means they belong to different sets, so adding this edge won’t create a cycle.

  6.2 - If the edge does not form a cycle:

- Add it to the `mst` list.
- Perform a `union()` operation to merge the two sets.
- **Stopping Condition:**
  - If `mst.size() == V - 1`, we stop because an MST with `V` vertices always has `V-1` edges.

---

#### **7. Printing the Output**

- Use a `for-each` loop to iterate over the `mst` list and print the final Minimum Spanning Tree.
- Each edge in the MST is displayed in the format:
  ```
  src - dest : weight
  ```

---

### **Conclusion**

- **Sorting edges** helps process the smallest-weight edge first.
- **The Disjoint Set** helps efficiently detect cycles and merge components.
- **The Kruskal's algorithm** iterates through edges, picks the smallest ones, and avoids cycles using the Disjoint Set.
- **Final Output**: A set of edges forming the Minimum Spanning Tree with the lowest possible weight.

---

**By Devanand Utkarsh.**

This README provides a complete overview of Kruskal's Algorithm, its implementation, and how to run the code. 🚀 Let me know if you need any modifications! 🎯
