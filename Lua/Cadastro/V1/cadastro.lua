local User = {}
User.__index = User

local arquive = "users.txt"

-- Construtor
function User:new(nome,sobrenome,idade,born) 
    local self = setmetatable({},User)
    self.nome = nome or "N/A"
    self.sobrenome = sobrenome or "N/A"
    self.idade = idade or 0
    self.idade = born or 0
    self.create = create or "unknown"

    return self
end

function User:addUser()
    print("Informe os dados cadastrais:")
    io.write("Nome: ")
    self.nome = io.read()
    io.write("Sobrenome: ")
    self.sobrenome = io.read()
    io.write("Idade: ")
    self.idade = tonumber(io.read())

    -- Data de nascimento
    local Pc_year = os.date("%Y")
    self.born = Pc_year - self.idade

    self.create = os.date("%d/%m/%Y %I:%M:%S %p")
    self.create = tostring(self.create)

    os.execute("clear")
end

function User:saveUser()
    local file = io.open(arquive,"a+")

    if file then
        file:write(self.nome..","..self.sobrenome..","..self.idade..","..self.born..","..self.create.."\n")
        print("Dados cadastrados!")
    else
        print("Erro ao abrir o arquivo.")
    end

    file:close()
end

function User:showUser()
    print("Nº | NOME           | SOBRENOME      | IDADE      | NASCIMENTO | CRIADO")

    local file = io.open(arquive,"r")
    local value = 1
    for line in file:lines() do
        local nome, sobre, idade, nasc, criado = line:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")

        -- Area de leitura de dados no terminal. (gabiarra, eu sei...)
        local n0 = string.len(value)
        local n1 = string.len(nome)
        local n2 = string.len(sobre)
        local n3 = string.len(idade)
        local n4 = string.len(nasc)
        local spacer0 = 3 - n0
        local spacer1 = 15 - n1
        local spacer2 = 15 - n2
        local spacer3 = 11 - n3
        local spacer4 = 11 - n4

        print(value..string.rep(" ",spacer0).."| "..nome..string.rep(" ",spacer1).."| "..sobre..string.rep(" ",spacer2).."| "..idade..string.rep(" ",spacer3).."| "..nasc..string.rep(" ",spacer4).."| "..criado)
        value = value + 1
    end
end

function User:searchUser()
    local file = io.open(arquive,"r")

    io.write("Informe o nome de busca: ")
    local user = io.read()
    local factor = false

    local nome, sobre, idade, nasc, criado = ""
    for line in file:lines() do
        nome, sobre, idade, nasc, criado = line:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")

        if user == nome then
            factor = true
            break
        end
    end

    if factor then
        print("\nUsuário encontrado:")
        print("Nome      : "..nome.."\nSobrenome : "..sobre.."\nIdade     : "..idade.."\nNascimento: "..nasc.."\nCriado    : "..criado)
    else
        print("\nUsuário inexistente")
    end

    file:close()
end

return User