(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (garota quantidade)
  (make-garota-magica
   :nome (garota-magica-nome garota)
   :escuridao (if (>= quantidade (garota-magica-escuridao garota))
                  0
                  (- (garota-magica-escuridao garota) quantidade))
   :bruxas (garota-magica-bruxas garota)))

(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 20 :bruxas 3))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 75 :bruxas 8))
         (mami (make-garota-magica :nome "Mami" :escuridao 40 :bruxas 15))
         (grupo (list madoka sayaka mami)))

    (format t "--- Grupo inicial ---~%")
    (format t "Escuridao total: ~a~%" (escuridao-total grupo))
    (format t "Bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (let* ((homura (make-garota-magica :nome "Homura" :escuridao 55 :bruxas 12))
           (grupo-novo (cons homura grupo)))
      (format t "--- Novo contrato ---~%")
      (format t "Escuridao do grupo novo: ~a~%" (escuridao-total grupo-novo))
      (format t "Escuridao do grupo anterior: ~a~%" (escuridao-total grupo)))

    (let ((sayaka-limpa (purifica sayaka 30)))
      (format t "--- Purificacao ---~%")
      (format t "Joia original: ~a~%" (garota-magica-escuridao sayaka))
      (format t "Joia purificada: ~a~%" (garota-magica-escuridao sayaka-limpa)))))

(main)