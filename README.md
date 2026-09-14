# Dev Toolbox

Uma coleção de scripts utilitários e automações desenvolvidos para otimizar a rotina de desenvolvimento, configuração de ambientes e gerenciamento de sistemas.

O objetivo deste repositório é centralizar ferramentas práticas de produtividade, garantindo a reutilização de código e a aplicação rigorosa de boas práticas de segurança.

---

## Organização do Repositório

As ferramentas estão divididas por categorias para facilitar a navegação:

### Autenticação e Segurança (`/auth`)
* **[Autenticação Kerberos](./auth/kerberos/)**: Script automatizado e seguro para autenticação de rede via terminal utilizando o comando `kinit`. Bloqueia a exibição de senhas na tela e utiliza variáveis de ambiente para caminhos de configuração.

### Git Utilities (`/git`)
* *Automações para fluxo de trabalho com Git (limpeza de branches antigas, padronização de commits, etc.) — Em desenvolvimento.*

### Gerenciamento de Sistema (`/system`)
* *Scripts para manutenção, monitoramento de recursos do sistema e automação de backups locais — Em desenvolvimento.*

---

## Como Utilizar

1. Colete as ferramentas clonando o repositório em sua máquina:
   ```bash
   git clone https://github.com
   ```
2. Acesse o diretório do script que deseja utilizar.
3. Garanta a permissão de execução para o arquivo:
   ```bash
   chmod +x nome-do-script.sh
   ```
4. Execute o script no terminal:
   ```bash
   ./nome-do-script.sh
   ```

---

## Diretrizes de Segurança

Todos os scripts presentes neste repositório seguem regras estritas para evitar vazamento de informações corporativas ou pessoais:
* **Entradas Interativas:** Senhas e tokens são capturados em tempo de execução de forma mascarada ou oculta.
* **Abstração de Escopo:** Nomes de servidores, caminhos internos, domínios e IDs corporativos são substituídos por placeholders ou variáveis de ambiente customizáveis.

---
*Fique à vontade para clonar, sugerir melhorias ou adaptar os scripts para as necessidades do seu dia a dia.*
