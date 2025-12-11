# Dotfiles

Meus dotfiles pessoais, gerenciados via **[chezmoi](https://github.com/twpayne/chezmoi)**, organizados para configuração rápida e fácil portabilidade.

![System](https://img.shields.io/badge/Arch%20Linux-Hyprland-1793d1?style=flat&logo=archlinux&logoColor=white)
![Manager](https://img.shields.io/badge/Managed%20by-chezmoi-0055d4?style=flat)

---

## 🚀 Fast Setup

Para aplicar estas configurações (puxar tudo do zero) em uma nova instalação, certifique-se de ter `git` e `chezmoi` instalados:

```bash
sudo pacman -S git chezmoi
````

### Instalação (One-Liner)

```bash
chezmoi init --apply git@github.com:fajremvp/dotfiles.git
```

- Isso irá inicializar o chezmoi, baixar este repositório e aplicar as configurações automaticamente na sua home.

-----

## 📂 Scripts & Configs Personalizados

Scripts desenvolvidos e configurações mantidas para otimizar o workflow e evitar bloatware:

| Arquivo | Descrição |
| :--- | :--- |
| **`hyprrun.sh`** | **[HyprRun](https://github.com/fajremvp/HyprRun)** é um launcher de aplicações minimalista que roda dentro do terminal (fzf-based). Substituto leve para o Rofi/Wofi. |
| **`hyprlock.conf`** | Configuração de bloqueio de tela minimalista, segura e visualmente limpa (com suporte a blur e inputs rápidos). |
| **`luz_noturna.sh`** | Controle manual de temperatura de cor da tela (filtro de luz azul) sem depender de localização/horário. |
| **`bateria.sh`** | Monitor de bateria sob demanda que exibe status via popup estilizado (figlet + lolcat). |
| **`uptime.sh`** | Exibe o tempo de atividade do sistema em um popup rápido (figlet + lolcat). |
| **`clock_date.sh`** | Exibe data e hora detalhadas em um popup flutuante estilizado (figlet + lolcat). |
| **`desligar_confirm.sh`** | Menu de confirmação de desligamento para evitar acidentes (figlet + lolcat). |
| **`randomize.sh`** | (**[Minegrub](https://github.com/Lxtharia/minegrub-theme)**) Randomiza o background e as frases do GRUB a cada boot. |

-----

## 📦 Gerenciamento com Chezmoi

Guia de referência para manutenção e versionamento dos dotfiles:

### Comandos Essenciais

```bash
# Inicializa um gerenciamento de dotfiles do zero na sua máquina
chezmoi init

# Inicializa um gerenciamento de dotfiles a partir de um repositório remoto
chezmoi init <repo-url>

# Aplica os arquivos já presentes localmente
chezmoi apply
```

### Gerenciamento de Arquivos

```bash
# Adiciona arquivos/diretórios no chezmoi para serem rastreados
chezmoi add <arquivo/diretório>

# Remove arquivos/diretórios do chezmoi (não apaga do disco)
chezmoi forget <arquivo/diretório>

# Atualiza os arquivos/diretórios já gerenciados (sincroniza mudanças locais para o chezmoi)
chezmoi re-add
```

### Diagnóstico e Visualização

```bash
# Mostra o status atual, comparando o que está no chezmoi com o que está no sistema
chezmoi status

# Lista todos os arquivos que o chezmoi gerencia
chezmoi list

# Mostra as diferenças entre os arquivos gerenciados no chezmoi e os do sistema
chezmoi diff
```

### Git Workflow (Versionamento)

Para enviar suas alterações para o GitHub ou outros repositórios remotos.

```bash
# Entra no diretório do repositório do chezmoi (~/.local/share/chezmoi)
chezmoi cd

# Garante que as mudanças locais foram registradas
chezmoi re-add

# Adiciona arquivos para commit no repositório
chezmoi git add .

# Faz o commit das alterações
git commit -m "mensagem"

# Envia as alterações para o repositório remoto
chezmoi git push

# Puxa atualizações do repositório remoto (caso tenha alterado em outra máquina)
chezmoi git pull
```
---
## 💡 Unlicense (domínio público)
“Apenas recursos escassos são passíveis de propriedade.” — Stephan Kinsella