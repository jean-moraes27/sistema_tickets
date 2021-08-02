User.create!([{
    name: "Administrador Ticket",
    email: "admin@ticket.com",
    active: true,
    password: 'administrador'
},{
    name: "Usuário Desativado",
    email: "user@ticket.com",
    active: false,
    password: 'usuario'
}])

p "#{User.count} usuários cadastrados"
