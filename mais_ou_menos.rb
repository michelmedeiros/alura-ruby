puts "Hello World"
puts "Qual é o seu nome?"
nome = gets
puts "Começaremos o jogo para você, " + nome
puts "\n\n\n"
puts "Aguarde, escolhendo um número secreto entre 0 e 200"
numero_secreto = 175
puts "\n\n\n"
puts "Escolhido! Que tal adivinhar nosso número secreto?"
puts "Escolha quantas tentativas deseja ter?"
limiteTentativa = gets

for tentativa in 1..limiteTentativa.to_i
    puts "Tentativa " + tentativa.to_s + " de " + limiteTentativa.to_s
    chute = gets
    puts "\n\n\n"
    puts "Será que acertou? Seu chute foi... " + chute
    acertou = numero_secreto == chute.to_i
    maior = chute.to_i > numero_secreto
    if acertou 
        puts "Parabéns, você acertou na tentativa: "  + tentativa.to_s
        break
    else 
        puts "Errou!"
        if maior
            puts "Seu número é maior que o valor esperado..."
        else
            puts "Seu número é menor que o valor esperado..."
        end    
    end
end    