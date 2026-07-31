from tkinter import *
from tkinter import messagebox

root = Tk()
root.title("8 Queens Puzzle")

SIZE = 8
buttons = []
queens = []

def is_safe(r, c):
    for qr, qc in queens:
        if qr == r or qc == c or abs(qr-r) == abs(qc-c):
            return False
    return True

def place(r, c):
    if (r, c) in queens:
        queens.remove((r, c))
        buttons[r][c]["text"] = ""
    else:
        if is_safe(r, c):
            queens.append((r, c))
            buttons[r][c]["text"] = "♛"
            if len(queens) == 8:
                messagebox.showinfo("Congratulations", "You solved the 8-Queens Puzzle!")
        else:
            messagebox.showwarning("Invalid Move", "Queen attacks another Queen!")

for i in range(SIZE):
    row = []
    for j in range(SIZE):
        color = "white" if (i+j) % 2 == 0 else "gray"
        b = Button(root,
                   width=4,
                   height=2,
                   bg=color,
                   font=("Arial", 18),
                   command=lambda r=i, c=j: place(r, c))
        b.grid(row=i, column=j)
        row.append(b)
    buttons.append(row)

root.mainloop()