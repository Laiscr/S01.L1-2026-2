data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String, 
  servico :: String, 
  valor :: Double, 
  etapa :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let deusDoRio =
        Atendimento { cliente = "Deus do Rio", servico = "Banho de ervas", 
        valor = 120.0, etapa = NaFila }
  let semRosto =
        Atendimento { cliente = "Sem Rosto", servico = "Banho simples", 
        valor = 60.0, etapa = NoBanho }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete", servico = "Banho de vapor", 
        valor = 80.0, etapa = NaFila }

  let atendimentos = [deusDoRio, semRosto, deusRabanete]
  let finalizados = [concluir deusDoRio, semRosto, concluir deusRabanete]

  putStrLn "--- Atendimentos do dia ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Depois de concluir alguns ---"
  mapM_ putStrLn (map descrever finalizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado finalizados))

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))