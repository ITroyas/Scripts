"""СЖАТИЕ ИЗОБРАЖЕНИЯ"""

from PIL import Image
from tkinter import Tk, Button, Label, GROOVE, messagebox
from tkinter import filedialog as fd
from pathlib import Path

# папка локального юзера
local_user = Path.home()

class Photo:
    def __init__(self):
        self.root = Tk()
        x = (self.root.winfo_screenwidth() - self.root.winfo_reqwidth()) / 2
        y = (self.root.winfo_screenheight() - self.root.winfo_reqheight()) / 2
        self.root.wm_geometry("+%d+%d" % (x, y))
        self.root.title('Resize images')
        self.root['bg'] = 'gray'
        self.root.resizable(False, False)
        self.root.minsize(width=250, height=100)
        self.root.bind('<Escape>', self._close)

    def run(self):
        self.widgets()
        self.root.mainloop()

    def widgets(self):
        Label(self.root, pady=10, text='Выбираешь фото, оно сжимается до необходимого размера \nи сохранается'
                                           ' на рабочий стол с именем "Сотрудник"\n'
                                           'Для выхода нажми Esc', bg='#A4A4A4', relief=GROOVE).pack()
        Button(self.root, text="Select and Save file", width=15, height=2,
                     bg='#210B61', fg='#2EFEF7', font='Times 14', bd=5, wraplength=100, command=self.open_save).pack()

    def open_save(self):
        try:
            types = (
                    ('JPG, PNG', 'jpg;*.jpeg;*.png'),
                )
            filename = fd.askopenfilename(title='SELECT FILE',
                                              filetypes=types, initialdir='M:/STAFF')
            self.photo = Image.open(filename)
            self.photo_size = self.photo.resize((500, 666))
            self.photo_size.save(fr'{local_user}\desktop\Сотрудник.jpg')
            self.photo.close()
        except:
            pass

    def _close(self, event):
        self.root.quit()


if __name__ == '__main__':
    Photo().run()