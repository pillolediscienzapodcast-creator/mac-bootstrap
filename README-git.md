# GitHub Bootstrap

Questa guida descrive come configurare Git e GitHub CLI su un nuovo Mac e come creare un nuovo repository GitHub **interamente dal terminale**, senza utilizzare il browser (tranne per l'autenticazione iniziale).

---

# Prerequisiti

Verificare di avere installato:

* Git
* Homebrew
* GitHub CLI (`gh`)

Controllo delle versioni:

```bash
git --version
brew --version
gh --version
```

---

# 1. Configurazione iniziale di Git

Impostare il nome che comparirà nei commit.

```bash
git config --global user.name "Massimo Dell'Erba"
```

Impostare l'indirizzo email associato all'account GitHub.

```bash
git config --global user.email "la-tua-email@esempio.com"
```

> È consigliato utilizzare la stessa email configurata sul proprio account GitHub, così i commit verranno associati automaticamente al profilo.

---

# 2. Configurazioni consigliate

Imposta `main` come branch predefinito.

```bash
git config --global init.defaultBranch main
```

Utilizza il merge standard durante i pull.

```bash
git config --global pull.rebase false
```

Elimina automaticamente i branch remoti non più esistenti.

```bash
git config --global fetch.prune true
```

Utilizza Visual Studio Code come editor di Git.

```bash
git config --global core.editor "code --wait"
```

Abilita i colori nel terminale.

```bash
git config --global color.ui auto
```

---

# 3. Verifica configurazione

Visualizzare tutta la configurazione corrente.

```bash
git config --global --list
```

Visualizzare solamente il nome utente.

```bash
git config --global user.name
```

Visualizzare solamente l'email.

```bash
git config --global user.email
```

---

# 4. Login a GitHub

Autenticare GitHub CLI.

```bash
gh auth login
```

Durante la procedura scegliere:

```
GitHub.com

HTTPS

Authenticate Git with your GitHub credentials → Yes

Login with a web browser
```

Il browser si aprirà automaticamente oppure verrà mostrato un codice da inserire nella pagina GitHub.

---

# 5. Verifica autenticazione

```bash
gh auth status
```

Output atteso:

```
✓ Logged in to github.com
✓ Git operations configured
✓ Token stored securely
```

---

# 6. Creazione di un nuovo progetto

Creare una nuova cartella.

```bash
mkdir ~/Projects/nome-progetto
cd ~/Projects/nome-progetto
```

---

# 7. Inizializzare Git

```bash
git init
```

---

# 8. Creare il file .gitignore

```bash
touch .gitignore
```

Esempio di contenuto:

```text
.DS_Store
.vscode/
.idea/
.env
```

---

# 9. Verificare lo stato del repository

```bash
git status
```

Tutti i file dovrebbero risultare come **Untracked**.

---

# 10. Aggiungere tutti i file

```bash
git add .
```

Verificare nuovamente:

```bash
git status
```

I file dovrebbero comparire nella sezione:

```
Changes to be committed
```

---

# 11. Primo commit

```bash
git commit -m "Initial commit"
```

Verificare la cronologia.

```bash
git log --oneline
```

Esempio:

```
f3a91d2 Initial commit
```

---

# 12. Creare automaticamente il repository GitHub

Supponiamo che il progetto si chiami:

```
mac-bootstrap
```

Posizionarsi nella cartella del progetto.

```bash
cd ~/Projects/mac-bootstrap
```

Creare il repository GitHub ed eseguire automaticamente il primo push.

```bash
gh repo create mac-bootstrap \
  --public \
  --source=. \
  --remote=origin \
  --push
```

## Significato dei parametri

`mac-bootstrap`

> Nome del repository che verrà creato su GitHub.

`--public`

> Il repository sarà pubblico.
>
> Se si desidera mantenerlo privato utilizzare:

```bash
--private
```

`--source=.`

> Indica a GitHub CLI che il repository locale corrente è la sorgente da pubblicare.

`--remote=origin`

> Crea automaticamente il remote Git chiamato `origin`.

`--push`

> Esegue automaticamente il primo `git push` verso GitHub.

---

# 13. Verifica del repository remoto

Visualizzare il remote configurato.

```bash
git remote -v
```

Output tipico:

```
origin  https://github.com/USERNAME/mac-bootstrap.git (fetch)
origin  https://github.com/USERNAME/mac-bootstrap.git (push)
```

---

# 14. Controllo finale

```bash
git status
```

Output atteso:

```
On branch main

Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

---

# Workflow quotidiano

Dopo aver modificato il progetto:

Aggiungere tutte le modifiche.

```bash
git add .
```

Creare un commit.

```bash
git commit -m "Descrizione della modifica"
```

Inviare le modifiche a GitHub.

```bash
git push
```

Aggiornare il repository locale con eventuali modifiche remote.

```bash
git pull
```

---

# Comandi utili

Visualizzare la cronologia dei commit.

```bash
git log --oneline
```

Visualizzare i branch.

```bash
git branch
```

Visualizzare il repository remoto.

```bash
git remote -v
```

Verificare lo stato del repository.

```bash
git status
```

Aprire il repository GitHub direttamente nel browser.

```bash
gh repo view --web
```

Clonare un repository.

```bash
gh repo clone OWNER/NOME_REPOSITORY
```

Creare un nuovo repository GitHub da una cartella già inizializzata.

```bash
gh repo create NOME_REPOSITORY --public --source=. --remote=origin --push
```

---

# Struttura consigliata dei progetti

```text
~/Projects/
│
├── mac-bootstrap/
├── startup-template/
├── klear-finance/
├── pillole-scienza/
├── human-monument/
└── experiments/
```

Mantenere tutti i progetti all'interno della cartella `~/Projects` rende più semplice l'organizzazione, il backup e il lavoro con strumenti come Claude Code, Docker e GitHub CLI.
