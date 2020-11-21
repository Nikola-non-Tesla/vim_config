# vim_config

- [Installazione](#installazione)
    - [ArchLinux - YCM](#archlinux_ycm)
- [Comandi](#comandi)
    - [Comandi debug](#comandi_debug)
- [Debugger file](#debugger_file)

## Installazione

    $ mv ~/.vimrc ~/.vimrc.old && cp vimrc ~/.vimrc && cp -R defaultcode/ .vim/defaultcode/
    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
Ora aprite vim (vi darà degli errori, premete invio e ignorateli) e eseguite il comando :PluginInstall
Installiamo il debugger, il seguente comando sarà soltanto per c e cpp, si potranno aggiungere altri comandi. 
Fare riferimento a [vimspector](https://github.com/puremourning/vimspector#supported-languages).

    $ ./.vim/bundle/vimspector/install_gadget.py --enable-c

Dopo aver fatto ciò si dovrà installare [YCM](https://github.com/ycm-core/YouCompleteMe#linux-64-bit), seguire le istruzioni nella suddetta pagina.

Caso particolare per archlinux (come sempre).
### ArchLinux - YCM

Vi servirà cmake, gcc, python3, clang. Dopo potrete eseguire il seguente comando:

    $ cd ~/.vim/bundle/youcompleteme && python3 install.py --clang-completer --system-libclang


## Comandi

Se è andato tutto a buon fine, cosa improbabile, allora i miei keybinding sono i seguenti:

* **F2**: Apre il tree delle directory (sinistra)
* **F3**: Apre una mappa (a destra) del programma, la quale vi elenca le variabili, funzioni, struct, ecc..
* **F5**: Compila e avvia (funziona in python, latex, g++, html (apre il browser), bibtex).
* **F6**: Spellcheck, **z=** per vedere le parole suggerite.

### Comandi debug
Il tasto `<leader>` è lo spazio, può essere cambiato nel file .vimrc
* **`<leader>dd`**: avvia il debug, e procede nel codice.
* **`<leader>de`**: chiude il debug
* **`<leader>db`**: posiziona un breakpoint

Gli altri sono meno importanti.


## Debugger file
Il debugger richiede la presenza del file .vimspector.json nella stessa cartella del file .c.
vimspector.json è posizionato nella cartella .vim/defaultcode/, se il tuo file .c avrà nome main.c basterà copiarlo.

Mentre se ha nome diverso dovreste modificare la nona riga del file vimspector.json con il ``` nome_del_tuofile.c.bin ```
