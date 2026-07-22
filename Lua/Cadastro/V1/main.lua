local cad = require("cadastro")

while true do
    entry = cad:new()
    print("-Menu"..string.rep("-",82))
    print("1) Novo")
    print("2) Consultar")
    print("3) Buscar")
    print("4) Sair")
    io.write("> ")
    local ask = io.read()
    ask = string.lower(ask)
    os.execute("clear")

    if ask == '1' or ask == 'novo' then
        entry:addUser()
        entry:saveUser()
    elseif ask == '2' or ask == 'consultar' then
        print("Usuários cadastrados:"..string.rep("-",66))
        entry:showUser()
    elseif ask == '3' or ask == 'buscar' then
        entry:searchUser()
    elseif ask == '4' or ask == 'sair' then
        os.execute("clear")
        print("Programa finalizado.")
        break
    else
        print("Operação inválida!")
    end
    
end