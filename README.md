run_8puzzle.

Basic 8-Puzzle Questions
Q1. What is the 8-Puzzle problem?

It is an AI problem consisting of 8 numbered tiles and one blank space arranged in a 3×3 grid. The objective is to reach the goal state by sliding tiles.

Q2. What is the initial state?

The starting arrangement of the puzzle.

Q3. What is the goal state?

The required final arrangement:
1 2 3
4 5 6
7 8 0


Q4. What does 0 represent?

It represents the blank space.

Q5. How many possible movements are there?

Four: Up, Down, Left and Right. However, valid movements depend on the blank tile's position.
2. Greedy Best-First Search
Q6. What is Greedy Best-First Search?

It is an informed search algorithm that selects the node with the lowest heuristic value.

Q7. What is a heuristic function?

A heuristic function estimates how close the current state is to the goal state.

Q8. Which heuristic is used in this program?

Manhattan Distance.

Q9. What is Manhattan Distance?

It is the sum of horizontal and vertical distances of each tile from its goal position.

Q10. What is the formula for Manhattan Distance?
\[
h(n)=\sum (|r-r_g|+|c-c_g|)
\]

Q11. Why is the blank tile ignored?

Because it is not a numbered tile.

Q12. Is Greedy Best-First Search optimal?

No, it does not guarantee the shortest path.

Q13. Is GBFS informed or uninformed search?

It is an informed search algorithm because it uses a heuristic function.

Q14. What is the difference between BFS and GBFS?
- BFS explores nodes level by level.
- GBFS selects nodes based on heuristic values.
3. Prolog-Related Questions
Q15. What is Prolog?

Prolog stands for Programming in Logic. It is a logic-based programming language used in Artificial Intelligence.

Q16. What is SWI-Prolog?

It is a free, open-source implementation of the Prolog language.

Q17. What is a predicate?

A predicate represents a relationship or condition in Prolog.

Q18. What is nth0/3?

It retrieves an element from a list using zero-based indexing.

Q19. What is findall/3?

It collects all possible solutions of a query into a list.

Q20. What is append/3?

It joins two lists into one list.

Q21. What is reverse/2?

It reverses the order of elements in a list.

Q22. What is member/2?

It checks whether an element exists in a list.

Q23. What is \+/1?

It represents negation as failure in Prolog.

Q24. What is is used for?

It evaluates an arithmetic expression and assigns its result.
4. Program-Specific Questions
Q25. What is the OPEN list?

It stores generated nodes that are waiting to be explored.

Q26. What is the CLOSED list?

It stores already explored states to avoid revisiting them.

Q27. What is sort/2 or keysort/2 used for?

It sorts elements based on their keys or values.

Q28. What is the purpose of valid_move?

It checks whether the blank tile can move in a particular direction.

Q29. What is the purpose of swap?

It exchanges the blank tile with an adjacent tile.

Q30. What is the purpose of manhattan_distance?

It calculates the heuristic value of the current puzzle state.

5. Important practical-based viva questions
These are especially useful because your examiner may ask you to explain your actual program.

Q31. What is the Manhattan Distance of the goal state?

Zero, because every tile is already in its correct position.

Q32. What is the Manhattan Distance of your initial state?

For your initial state:
1 2 3
4 0 6
7 5 8


The answer is 2.

Q33. How many moves are required to reach the goal?

Two moves:
1. Down
2. Right
Q34. What is the time complexity of GBFS?

In the worst case, it can be exponential.

Q35. What happens if the puzzle has no solution?

The search terminates with failure when the OPEN list becomes empty, provided the implementation handles this condition.

Q36. Can we use another heuristic?

Yes. We can use the misplaced tiles heuristic.

Q37. What is the difference between misplaced tiles and Manhattan Distance?
- Misplaced tiles count how many tiles are in the wrong position.
- Manhattan Distance calculates the total horizontal and vertical distance of misplaced tiles from their goal positions.

Quick revision – Remember these 10 points
Concept	Answer
Language	Prolog
Environment	SWI-Prolog
Algorithm	Greedy Best-First Search
Search type	Informed
Heuristic	Manhattan Distance
Blank tile	0
Initial state	Starting arrangement
Goal state	[1,2,3,4,5,6,7,8,0]
OPEN	Nodes to explore
CLOSED	Explored nodes




### **Program Explanation – 8 Puzzle using GBFS**

1\. **goal_state:** Defines the final puzzle arrangement `[1,2,3,4,5,6,7,8,0]`.

2\. **run_8puzzle:** Main predicate that starts the program and displays the initial and goal boards.

3\. **manhattan_distance:** Calculates the distance of each tile from its correct position. This is the heuristic function.

4\. **valid_move:** Checks the four possible movements of the blank tile (Up, Down, Left, Right).

5\. **swap:** Exchanges the blank tile with an adjacent tile.

6\. **solve_puzzle:** Implements Greedy Best-First Search by selecting the state with the lowest heuristic value.

7\. **sort_puzzle_open:** Sorts the OPEN list based on heuristic values.

8\. **tile_distance:** Calculates the horizontal and vertical distance of an individual tile.

9\. **print_board:** Displays the puzzle in a 3×3 format.

10\. **print_solution_path:** Displays all states from the initial state to the goal state.

**In short:** The program calculates Manhattan Distance, selects the state with the lowest distance, generates valid moves and repeats until the goal state is reached.
