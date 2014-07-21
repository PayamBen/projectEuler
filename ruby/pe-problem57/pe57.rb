def nlength(n)
  c = 0
  while(n >= 1) 
    n /= 10
    c += 1
  end
  c
end

def pe56(i)
  nom, dom, td, c = 3, 2, 0, 0
  2.upto(i) do |x|
    td = nom + dom
    nom, dom = td + dom, td
    if (nlength(nom) > nlength(dom))
      printf "%d/%d\n",nom,dom
      c += 1
    end
  end
  printf "answer = %d\n",c
end

pe56(1000)
