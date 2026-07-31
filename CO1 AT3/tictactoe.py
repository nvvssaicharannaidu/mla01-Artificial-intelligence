from tkinter import *
from tkinter import messagebox

root = Tk()
root.title("Tic-Tac-Toe (Minimax AI)")

board = [""] * 9
buttons = []

def check(b):
    wins = [(0,1,2),(3,4,5),(6,7,8),
            (0,3,6),(1,4,7),(2,5,8),
            (0,4,8),(2,4,6)]
    for a,c,d in wins:
        if b[a] == b[c] == b[d] != "":
            return b[a]
    if "" not in b:
        return "Draw"
    return None

def minimax(b, is_ai):
    result = check(b)
    if result == "O":
        return 1
    if result == "X":
        return -1
    if result == "Draw":
        return 0

    if is_ai:
        best = -999
        for i in range(9):
            if b[i] == "":
                b[i] = "O"
                score = minimax(b, False)
                b[i] = ""
                best = max(best, score)
        return best
    else:
        best = 999
        for i in range(9):
            if b[i] == "":
                b[i] = "X"
                score = minimax(b, True)
                b[i] = ""
                best = min(best, score)
        return best

def ai_move():
    best_score = -999
    move = -1
    for i in range(9):
        if board[i] == "":
            board[i] = "O"
            score = minimax(board, False)
            board[i] = ""
            if score > best_score:
                best_score = score
                move = i

    if move != -1:
        board[move] = "O"
        buttons[move]["text"] = "O"

    result = check(board)
    if result:
        end_game(result)

def click(i):
    if board[i] == "" and check(board) is None:
        board[i] = "X"
        buttons[i]["text"] = "X"

        result = check(board)
        if result:
            end_game(result)
        else:
            ai_move()

def end_game(result):
    if result == "Draw":
        messagebox.showinfo("Game Over", "It's a Draw!")
    else:
        messagebox.showinfo("Game Over", result + " Wins!")

for i in range(9):
    b = Button(root,
               text="",
               width=6,
               height=3,
               font=("Arial",20),
               command=lambda x=i: click(x))
    b.grid(row=i//3, column=i%3)
    buttons.append(b)

root.mainloop()