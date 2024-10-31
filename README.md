# web-club

Um programa Web para uma empresa de "Clube de benefícios" com foco em consultas médicas, desenvolvido inicialmente por nós, juntamente com o aplicativo [app-club](https://github.com/ribollitiago/app-club), mas depois vendido para ser continuado pelos desenvolvedores da empresa.

## 🛠️ Construído com

* [Flutter](https://flutter.dev/) - O framework utilizado
* [Firebase](https://firebase.google.com/) - Banco de Dados
* [ViaCep](https://viacep.com.br) - API para a pesquisa de CEP
* [MobX](https://mobx.pub/) - Gerenciamento de estado reativo

### Organização e Gerenciamento de Estado com MobX

Para manter o código organizado e escalável, este projeto utiliza o [MobX](https://pub.dev/packages/mobx) como base para gerenciamento de estado. O MobX é uma biblioteca que permite a implementação de um padrão de programação reativa, facilitando o gerenciamento de estados complexos de maneira previsível e fluida. 

Com o MobX, foi possível separar e organizar o código em **stores** (repositórios de estado), que armazenam o estado da aplicação e permitem uma sincronização em tempo real das mudanças de estado com a interface do usuário. Esse modelo reativo simplifica o acompanhamento de estados em diferentes telas e componentes, proporcionando uma arquitetura mais modular e fácil de manter.

# Telas
Detalhes das telas desenvolvidas no sistema.

## Login
Tela de autenticação inicial, onde os funcionários podem acessar o sistema inserindo suas credenciais.

![Tela de Login](https://github.com/user-attachments/assets/b6694477-fce5-42ac-af64-8a37a06ef80d)

## Home do Administrador
Tela principal do Administrador, com acesso a todas as funcionalidades do sistema, incluindo cadastro de funcionários, clientes, parceiros e vendas.

![Tela Home do Administrador](https://github.com/user-attachments/assets/c11cbc24-5750-4cd9-9bd8-bbfa6f457358)

## Home do Funcionário Comum
Tela inicial para os funcionários comuns, com acesso a funcionalidades limitadas, de acordo com as permissões de cada usuário.

![Tela Home do Funcionário](https://github.com/user-attachments/assets/611b8b69-58c8-49b9-882c-6ce2036d0798)

## Cadastro do Cliente
Tela de cadastro de novos clientes, onde os funcionários podem adicionar informações pessoais e dados de endereço.

![Tela de Cadastro de Cliente](https://github.com/user-attachments/assets/4b1dd163-64b1-49c0-8cae-dc3e635f203f)

## Cadastro de Funcionário
Exclusiva para contas com acesso de Administrador, essa tela permite o cadastro de novos funcionários que terão acesso ao sistema.

![Tela de Cadastro de Funcionário](https://github.com/user-attachments/assets/e7da7f31-216b-48a4-9c87-ef37d8c5939e)

## Cadastro de Parceiro
Tela de cadastro de novos parceiros que aparecerão na tela inicial do [app-club](https://github.com/ribollitiago/app-club). Os parceiros são exibidos para que os clientes possam marcar consultas diretamente pelo app.

![Tela de Cadastro de Parceiro](https://github.com/user-attachments/assets/8cfe617c-825c-40d7-8250-8baee074e35b)

## Cadastro de Venda
Tela onde os funcionários podem registrar novas vendas feitas, vinculadas diretamente ao banco de dados e ao funcionário responsável.

![Tela de Cadastro de Venda](https://github.com/user-attachments/assets/c5a969cd-a363-47e8-b9f5-3caf5a28cead)

## Cadastro de Plano
Tela para cadastrar novos planos de assinatura para os usuários do [app-club](https://github.com/ribollitiago/app-club), permitindo que eles escolham entre as opções de benefício oferecidas pelo clube.

![Tela de Cadastro de Plano](https://github.com/user-attachments/assets/e2195d93-9742-4733-9dde-d11d7bf8486e)

## 📡 API

Este projeto integra-se com a [API ViaCep](https://viacep.com.br) para consulta de CEPs, permitindo preenchimento automático do endereço durante o cadastro dos usuários. A API é gratuita e fornece informações detalhadas de endereço a partir do CEP informado, facilitando o processo de cadastro e melhorando a experiência do usuário.

## 📌 Versão

(Projeto finalizado) Última versão projetada por nós.

## ✒️ Autores

[Tiago Ribolli](https://gist.github.com/ribollitiago) e [Gabriel Figueiredo](https://gist.github.com/GabrielFMA)

---
⌨️ por [Tiago Ribolli](https://gist.github.com/ribollitiago)
