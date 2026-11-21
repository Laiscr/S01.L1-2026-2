(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (dominio)
  (* (dominio-mora dominio)
     (bonus-elemental (dominio-elemento dominio))))

(defun rota (lista dificuldade-maxima)
  (let* ((acessiveis (remove-if-not
                      (lambda (dominio) (<= (dominio-dificuldade dominio) dificuldade-maxima))
                      lista))
         (textos (mapcar
                  (lambda (dominio)
                    (format nil "~a - ~,2f mora" (dominio-nome dominio) (recompensa-final dominio)))
                  acessiveis)))
    textos))

(defun main ()
  (let ((dominios
         (list
          (make-dominio :nome "Cecilia Garden" :elemento :anemo :dificuldade 2 :mora 2000)
          (make-dominio :nome "Hidden Palace of Lianshan" :elemento :electro :dificuldade 4 :mora 5000)
          (make-dominio :nome "Clear Pool and Mountain Cavern" :elemento :hydro :dificuldade 3 :mora 3500)
          (make-dominio :nome "Peak of Vindagnyr" :elemento :cryo :dificuldade 5 :mora 6000)
          (make-dominio :nome "Domain of Guyun" :elemento :pyro :dificuldade 1 :mora 1500))))

    (format t "--- Rota para dificuldade maxima 3 ---~%")
    (dolist (texto (rota dominios 3))
      (format t "~a~%" texto))

    (format t "Total de mora de todos os dominios: ~,2f~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (format t "--- O Lisp permite alterar (setf) ---~%")
    (let ((copia (copy-dominio (car dominios))))
      (setf (dominio-mora copia) 9999)
      (format t "Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora (car dominios))))))

(main)