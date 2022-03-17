# ToDoList

Meu primeiro aplicativo de estudos, onde apresento uma lista de tarefas, colocando em prática alguns de meus conhecimentos.

## Tecnologias

O app foi desenvolvido em `Swift`, seguindo a arquitetura `MVC`.

As telas foram desenvolvidas ***programaticamente***, implementando o protocolo `ViewCode`, visando assim seguir um padrão.

Implementei para minhas listas, ToDoTasks e DoneTasks uma `UITableView`, onde cada uma é representada por uma seção.

Ultilizei para a adição de novas tarefas um `UIButton`, fazendo assim um `present` de um novo `ViewController`, contendo um `UITextField` para o **title**, e um `UITextView` para a **descrição** da task, com um `UIButton` para fazer a confirmação da adição.

Para o armazenamento local de minhas ToDoTasks e 
DoneTasks, trabalhei com `UsersDefault`.

## Desafios

Criar um tratamento para lidar com o armazenamento local, tendo que trabalhar com o `Codable`, e filtros para controlar a adição/remoção.

Colocando assim em prática pela primeira vez, os conhecimentos que adquiri ao longo de uma mentoria dada a mim, por um Desenvolvedor IOS com muitos anos de experiência.
