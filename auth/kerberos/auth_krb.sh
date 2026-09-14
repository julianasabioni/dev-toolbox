
#!/bin/bash

#Define o KRB5_CONFIG
export KRB5_CONFIG=/caminho/projeto/krb5

read -s -p "Digite a senha Kerberos: " PASSWORD
echo

echo "$PASSWORD" | kinit c1353367@BB.COM.BR

if [ $? -eq 0 ]; then 
	echo "Autenticação realizada com sucesso."
else 

	echo "Erro na autenticação." 
fi

