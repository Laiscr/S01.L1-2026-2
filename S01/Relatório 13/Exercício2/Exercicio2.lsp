(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defparameter *catalogo*
  (list
   (make-criatura :nome "Peeper" :bioma "Recifes Rasos" :profundidade 30 :perigo :inofensiva)
   (make-criatura :nome "Stalker" :bioma "Floresta de Algas" :profundidade 120 :perigo :agressiva)
   (make-criatura :nome "Reaper Leviathan" :bioma "Zona Dunas" :profundidade 250 :perigo :leviata)
   (make-criatura :nome "Ghost Leviathan" :bioma "Rio Fantasma" :profundidade 700 :perigo :leviata)
   (make-criatura :nome "Bladderfish" :bioma "Recifes Rasos" :profundidade 20 :perigo :inofensiva)))

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "Leviata: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a - ~a - ~am - ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defun main ()
  (format t "--- Catalogo do Scanner ---~%")
  (dolist (texto (mapcar #'descreve-criatura *catalogo*))
    (format t "~a~%" texto))

  (let ((profundas (abaixo-de 100 *catalogo*)))
    (format t "--- Abaixo de 100 metros ---~%")
    (dolist (texto (mapcar #'descreve-criatura profundas))
      (format t "~a~%" texto))
    (format t "Total de criaturas abaixo de 100m: ~a~%" (length profundas))))

(main)