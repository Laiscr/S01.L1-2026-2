data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let blueMountain = Cafe "Blue Mountain" 12.0 9
  let houseBlend = Cafe "House Blend" 8.0 6
  let kilimanjaro = Cafe "Kilimanjaro" 10.0 3

  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever blueMountain)
  putStrLn (forca blueMountain)
  putStrLn (descrever houseBlend)
  putStrLn (forca houseBlend)
  putStrLn (descrever kilimanjaro)
  putStrLn (forca kilimanjaro)

  putStrLn "--- Preco do House Blend ---"
  print (precoDoPedido True houseBlend)
  print (precoDoPedido False houseBlend)