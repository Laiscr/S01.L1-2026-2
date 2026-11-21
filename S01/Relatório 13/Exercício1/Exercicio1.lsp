(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (cond ((>= (erva-toxicidade erva) 7) "veneno")
        ((>= (erva-toxicidade erva) 4) "use com cuidado")
        (t "segura")))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$~,2f por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      "Maomao vai testar esta erva em si mesma antes."
      "Liberada para o paciente."))

(defun main ()
  (let* ((aconito (make-erva :nome "Aconito" :preco-por-grama 12.5 :toxicidade 9))
         (beladona (make-erva :nome "Beladona" :preco-por-grama 8.0 :toxicidade 5))
         (camomila (make-erva :nome "Camomila" :preco-por-grama 2.0 :toxicidade 1))
         (estoque (list aconito beladona camomila)))

    (format t "--- Estoque da Farmacia ---~%")
    (dolist (erva estoque)
      (format t "~a~%" (descreve-erva erva))
      (format t "  ~a~%" (aviso erva)))

    (format t "--- Preco da dose ---~%")
    (format t "Camomila, 15 gramas: R$~,2f~%" (preco-da-dose camomila 15))))

(main) ; amei a ref deste exercicio :D