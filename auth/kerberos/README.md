# Autenticação Segura via Terminal com Kerberos e Bash Script

Este projeto apresenta um script em Shell Script (`.sh`) desenvolvido para automatizar e facilitar o processo de autenticação em redes corporativas que utilizam o protocolo **Kerberos**. 

O script foi desenhado seguindo boas práticas de segurança, garantindo que credenciais sensíveis nunca fiquem expostas no código-fonte.

---

## O que é Kerberos e o comando `kinit`?

O **Kerberos** é um protocolo de autenticação de rede de computador que funciona com base em "tickets" para permitir que nós se comuniquem em uma rede não segura de forma a provar sua identidade uns aos outros de maneira segura.

O comando **`kinit`** é uma ferramenta utilizada em sistemas Unix/Linux para obter e armazenar o ticket de concessão de ticket (TGT) do Kerberos. É ele quem valida o par `usuário + senha` junto ao Centro de Distribuição de Chaves (KDC).

---

## Boas Práticas de Segurança Aplicadas

Para tornar este script seguro e pronto para portfólios públicos, foram aplicadas as seguintes técnicas:

1. **Entrada de Senha Oculta (`read -s`):** O parâmetro `-s` (silent) do comando `read` impede que os caracteres da senha sejam exibidos na tela enquanto o usuário digita, evitando ataques de "olhada sobre o ombro" (*shoulder surfing*).
2. **Abstração de Identidade (Variáveis):** O script não possui valores fixos (*hardcoded*) de matrículas, usuários ou domínios de infraestrutura corporativa. Tudo é parametrizado dinamicamente via variáveis de ambiente ou entradas em tempo de execução.
3. **Isolamento de Configuração (`KRB5_CONFIG`):** Utiliza um fallback dinâmico para localizar o arquivo de configuração do Kerberos, permitindo que o script funcione em múltiplos ambientes sem expor caminhos absolutos do servidor de produção.

---

## Como Utilizar

### 1. Pré-requisitos
Certifique-se de ter os clientes do Kerberos instalados em seu ambiente Linux:
```bash
sudo apt-get install krb5-user
```

### 2. Executando o Script
Dê permissão de execução ao arquivo e execute-o:
```bash
chmod +x autenticar.sh
./autenticar.sh
```

### 3. Parâmetros dinâmicos (Opcional)
Você pode sobrescrever o caminho do arquivo de configuração do Kerberos definindo a variável antes da execução:
```bash
export KRB5_CONFIG_PATH="/seu/caminho/customizado/krb5"
./autenticar.sh
```

---

## O Código do Script (`autenticar.sh`)

```bash
#!/bin/bash

# Define o caminho do arquivo de configuração do Kerberos usando uma variável de ambiente
# Se a variável não estiver definida, usa um caminho padrão fictício/exemplo
export KRB5_CONFIG="\${KRB5_CONFIG_PATH:-/projeto/seu-uuid-aqui/workdir/resources/krb5}"

# Solicita o usuário de forma dinâmica
read -p "Digite o seu usuário Kerberos (ex: f1234567@DOMINIO.COM.BR): " KRB_USER

# Solicita a senha de forma segura (oculta no terminal)
read -s -p "Digite a senha Kerberos: " PASSWORD
echo ""

# Realiza a autenticação via kinit passando a senha pelo pipeline
echo "PASSWORD" | kinit "KRB_USER"

# Verifica se o comando kinit foi executado com sucesso
if [ \$? -eq 0 ]; then 
    echo "Autenticação realizada com sucesso." 
else 
    echo "Erro na autenticação." 
fi
```

