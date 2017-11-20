def boas_vindas
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end

def sorteio_numero_secreto(dificuldade)
    case dificuldade
    when 1
        maximo = 10
    when 2    
        maximo = 50
    when 3
        maximo = 100
    else
        maximo = 200
    end            
    puts "Aguarde, escolhendo um número secreto entre 1 e #{maximo}"
    sorteado = rand(maximo) + 1
    puts "\n\n\n"
    sorteado
end

def limite_de_tentativas
    puts "Escolhido! Que tal adivinhar nosso número secreto?"
    puts "Escolha quantas tentativas deseja ter?"
    chute = gets.strip
end

def pede_um_numero(tentativa, limiteTentativa, ultimos_escolhidos)
    puts "\n\n\n"
    puts "Tentativa #{tentativa} de #{limiteTentativa}"
    puts "Números já escolhidos #{ultimos_escolhidos}"
    chute = gets.strip
    puts "\n\n\n"
    puts "Será que acertou? Seu chute foi... " + chute
    chute.to_i
end

def pede_dificuldade
    puts "Escolha um nível de dificuldade: 1- Fácil, 2- Médio, 3- Difícil"
    dificuldade = gets.to_i
end    

def verifica_se_acertou(chute, tentativa, numero_secreto)
    acertou = numero_secreto == chute
    maior = chute > numero_secreto
    if acertou 
        puts "Parabéns, você acertou na tentativa: #{tentativa}"
        ganhou
        return true
    end 
    puts "Errou!"
    if maior
        puts "Seu chute #{chute} é maior que o valor esperado..."
    else
        puts "Seu chute #{chute} é menor que o valor esperado..."
    end
    false
end

def adivinhe_o_numero(nome, limiteTentativa)
    dificuldade = pede_dificuldade
    numero_secreto = sorteio_numero_secreto(dificuldade)
    ultimos_escolhidos = []
    pontos_ate_agora = 1000

    

    for tentativa in 1..limiteTentativa.to_i
        chute = pede_um_numero(tentativa, limiteTentativa, ultimos_escolhidos)
        if nome == "Michel"
            puts "Acertou!"
            break
        end
        ultimos_escolhidos << chute
        pontos_a_perder = (numero_secreto - chute).abs / 2.0
        pontos_ate_agora -= pontos_a_perder
        if verifica_se_acertou(chute, tentativa, numero_secreto)
            break
        else if limiteTentativa.to_i == tentativa
            puts "Você chegou ao limite de tentativas, seu número secreto é: #{numero_secreto}"
        end    
    end        
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."

end

def nao_quer_jogar
    puts "Deseja jogar novamente? (S/N)"
    quero_jogar = gets.strip
    nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = boas_vindas
loop do
    adivinhe_o_numero(nome, limite_de_tentativas)
    break if nao_quer_jogar
end


