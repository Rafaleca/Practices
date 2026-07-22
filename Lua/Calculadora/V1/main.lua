local entrada = require("calc")

local function term_cleaner()
    -- Limpeza do terminal.
    -- clear > Linux | cls > Windows (se o sistema permitir)
    os.execute("clear")
end

local function number_insert(a, b)
    print("Informe os números a serem calculados:")
    io.write("> ")
    local a = tonumber(io.read())
    io.write("> ")
    local b = tonumber(io.read())

    return a, b
end

local function type_calc(result)
    local formas = {"Soma", "Subtração", "Multiplicação", "Divisão", "Exponenciação"}

    num1, num2 = number_insert()

    print("Informe o calculo desejado:")
    for i, v in pairs(formas) do
        print(i..") "..v)
    end
    io.write("> ")
    local x = io.read()
    x = string.lower(x)

    if x == '1' or x == 'soma' then
        print("Soma")

        result = entrada.soma(num1, num2)
    elseif x == '2' or x == 'subtração' then
        print("Subtração")
        
        result = entrada.subtracao(num1, num2)
    elseif x == '3' or x == 'multiplicação' then
        print("Multiplicação")

        result = entrada.mult(num1, num2)
    elseif x == '4' or x == 'divisão' then
        print("Divisão")

        result = entrada.div(num1, num2)
    elseif x == '5' or x == 'exponenciação' then
        print("Exponenciação")

        result = entrada.exp(num1, num2)
    else
        print("Valor não reconheçido.\nFavor informe novamente")
    end
    
    term_cleaner()
    return result
end

local function main_code()
    print("Programa de calculos simples versão 1")

    local op = type_calc()

    print("Resultado da operação: "..op.."\n")

    io.write("Deseja realizar um novo calculo (S/N):")
    local ask = tostring(io.read())
    ask = string.lower(ask)

    if ask == 's' then
        term_cleaner()
        main_code()
    else
        print("Programa finalizando...")
    end
end

main_code()