# Mac Bootstrap

Questa guida descrive come configurare un nuovo Mac per lo sviluppo software.

L'obiettivo è ottenere un ambiente identico su qualsiasi nuovo computer in meno di 30 minuti.

---

# Prerequisiti

* macOS aggiornato
* Connessione Internet
* Account GitHub
* Permessi amministratore sul Mac

---

# 1. Installazione di Docker Desktop

Scaricare Docker Desktop dal sito ufficiale.

https://www.docker.com/products/docker-desktop/

Installare il file `.dmg`.

Al termine avviare Docker Desktop.

Verificare che il motore Docker sia in esecuzione.

Verifica:

```bash
docker --version
```

Verifica Docker Compose:

```bash
docker compose version
```

---

# 2. Installazione Command Line Tools

Installare i Command Line Tools Apple.

Verifica:

```bash
git --version
```

Se Git non è installato:

```bash
xcode-select --install
```

Nel caso il download automatico fallisca, installare manualmente i Command Line Tools dal portale Apple Developer.

---

# 3. Installazione di Homebrew

Installare Homebrew.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Aggiungere Homebrew al PATH.

```bash
echo >> ~/.zprofile
```

```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> ~/.zprofile
```

```bash
eval "$(/opt/homebrew/bin/brew shellenv zsh)"
```

Verifica:

```bash
brew --version
```

---

# 4. Struttura delle cartelle

Creare una cartella dedicata a tutti i progetti.

```bash
mkdir ~/Projects
```

All'interno verranno mantenuti tutti i repository.

Esempio:

```text
~/Projects/

mac-bootstrap/
startup-template/
klear-finance/
pillole-scienza/
human-monument/
experiments/
```

---

# 5. Creazione del progetto mac-bootstrap

```bash
cd ~/Projects

mkdir mac-bootstrap

cd mac-bootstrap
```

---

# 6. Brewfile

Creare il file.

```bash
touch Brewfile
```

Contenuto consigliato.

```ruby
# CLI
brew "git"
brew "gh"
brew "wget"
brew "jq"
brew "tree"
brew "htop"
brew "fzf"

# Python
brew "python"
brew "uv"

# Javascript
brew "node"
brew "pnpm"

# Database
brew "postgresql@16"
brew "redis"

# Utilities
brew "watch"

# Applications
cask "visual-studio-code"
```

Il Brewfile rappresenta l'elenco completo del software che deve essere presente sul computer.

---

# 7. Installazione automatica

Eseguire:

```bash
brew bundle
```

Homebrew installerà automaticamente tutti i pacchetti mancanti.

È possibile eseguire il comando più volte.

Installerà solamente ciò che non è già presente.

---

# 8. PostgreSQL

Avviare PostgreSQL.

```bash
brew services start postgresql@16
```

Poiché PostgreSQL 16 è una formula "keg-only", aggiungere il client al PATH.

```bash
echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> ~/.zshrc
```

Ricaricare la configurazione.

```bash
source ~/.zshrc
```

Verifica.

```bash
psql --version
```

---

# 9. Redis

Avviare Redis.

```bash
brew services start redis
```

Verifica.

```bash
redis-server --version
```

---

# 10. Script del bootstrap

La struttura consigliata è la seguente.

```text
mac-bootstrap/

Brewfile

README.md

install.sh

doctor.sh

verify.sh

update.sh

scripts/
    git-setup.sh
```

---

# install.sh

Responsabilità:

* aggiornare Homebrew;
* installare tutti i pacchetti del Brewfile;
* avviare PostgreSQL;
* avviare Redis;
* configurare automaticamente il PATH di PostgreSQL (evitando duplicati).

---

# doctor.sh

Controlla che siano installati:

* Git
* Homebrew
* Docker
* Docker Compose
* Python
* Node
* npm
* pnpm
* GitHub CLI
* PostgreSQL
* Redis
* VS Code
* uv

Mostra anche la versione installata di ciascun componente.

---

# verify.sh

Esegue una verifica rapida dell'ambiente mostrando le versioni dei principali strumenti.

Serve come controllo immediato dopo una nuova installazione.

---

# update.sh

Aggiorna l'intero ambiente.

```bash
brew update

brew upgrade

brew cleanup
```

Può essere eseguito periodicamente.

---

# 11. Controlli finali

Verificare:

```bash
brew --version
```

```bash
git --version
```

```bash
docker --version
```

```bash
docker compose version
```

```bash
python3 --version
```

```bash
node --version
```

```bash
npm --version
```

```bash
pnpm --version
```

```bash
gh --version
```

```bash
psql --version
```

```bash
redis-server --version
```

---

# Aggiornamento di un nuovo Mac

Quando si acquista un nuovo computer:

1. Installare Docker Desktop.
2. Installare i Command Line Tools.
3. Installare Homebrew.
4. Clonare il repository.

```bash
git clone https://github.com/<USERNAME>/mac-bootstrap.git
```

5. Entrare nella cartella.

```bash
cd mac-bootstrap
```

6. Eseguire.

```bash
./install.sh
```

7. Configurare Git.

```bash
./scripts/git-setup.sh
```

8. Verificare.

```bash
./doctor.sh
```

Al termine il Mac sarà configurato con lo stesso ambiente di sviluppo utilizzato negli altri computer.

---

# Roadmap della piattaforma

Questo repository rappresenta il primo componente della piattaforma di sviluppo.

I repository successivi saranno:

```text
mac-bootstrap/
```

Configurazione del computer.

```text
startup-template/
```

Template completo per tutte le nuove applicazioni.

```text
playground/
```

Area per test e sperimentazioni.

Successivamente verranno creati i repository applicativi, ad esempio:

```text
klear-finance/
pillole-scienza/
human-monument/
```

Tutti utilizzeranno lo stesso stack e le stesse convenzioni definite in `mac-bootstrap`.
