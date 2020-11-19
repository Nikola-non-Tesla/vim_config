# vim_config
#Prefazione
Ci sono due tipo di configurazione tra cui scegliere:
	+ Vim Lite: quello che uso principalmente, molto veloce, bisogna soltanto creare il file.c senza tutta struttura di cartelle, ecc... ma **non ha il debugger integrato**.
	+ Vim Full: configurazione completa, creerà una folder struct uguale a quella di un qualsiasi ide, ma è molto più pesante. **Comprende il debugger**.

#Installazione - Vim Lite
    $ mv ~/.vimrc ~/.vimrc.old && cp vimrc_lite ~/.vimrc && cp -R defaultcode/ .vim/defaultcode/
    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
 
Ora aprite vim (vi darà degli errori, premete invio e ignorateli) e eseguite il comando :PluginInstall
Dopo aver fatto ciò bisognerà installare [YCM](https://github.com/ycm-core/YouCompleteMe#linux-64-bit), seguire le istruzioni nella suddetta pagina.

Caso particolare per archlinux (come sempre).
##ArchLinux
Vi servità cmake, gcc, python3, clang. Dopo potrete eseguire il seguente comando:
    $ cd ~/.vim/bundle/youcompleteme && python3 install.py --clang-completer --system-libclang


##Utilizzo
Se è andato tutto a buon fine, cosa improbabile, allora i miei keybindig sono i seguenti:

	+ **F5**: Compila e avvia (funziona in python, latex, g++, html (apre il browser), bibtex).
	+ **F8**: Apre il tree delle directory (sinistra)
	+ **F9**: Apre una mappa (a destra) del programma, la quale vi elenca le variabili, funzioni, struct ecc..


#Intallazione - Vim Full
**coming soon**



