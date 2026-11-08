data Esboco = Esboco
  { titulo  :: String, 
  tecnica :: String, 
  horas :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

-- Caso base adicionado para evitar 'non-exhaustive patterns'
contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruina Submersa", tecnica = "nanquim", horas = 6 }, 
        Esboco { titulo = "Criatura da Neblina", tecnica = "carvao", horas = 4 }, 
        Esboco { titulo = "Torre Abandonada", tecnica = "grafite", horas = 3 }]

  putStrLn "--- Caderno ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])
  putStrLn ("Esbocos: " ++ show (contarEsbocos []))

  let cadernoNovo =
        Esboco { titulo = "Floresta Morta", tecnica = "nanquim", horas = 5 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))

  putStrLn "--- Caderno anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))

   -- putStrLn (titulo (head []))  -- erro ao executar: Prelude.head: empty list