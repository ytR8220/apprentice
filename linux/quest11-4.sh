while true; do
  echo "How many times do you want to repeat?"
  read num
  if [[ $num =~ ^-?[0-9]+$ ]]; then
    break
  else
    echo "Please enter an intrger."
  fi
done
while true; do
  echo "odd or even?"
  read x
  if [ $x = "odd" ]; then
    for n in `seq 1 $num`; do
      if [ $((n % 2)) = 1 ]; then
        echo $n
      fi
    done
    break
  elif [ $x = "even" ]; then
    for n in `seq 1 $num`; do
      if [ $((n % 2)) = 0 ]; then
        echo $n
      fi
    done
    break
  else
    echo "Please choose odd or even."
  fi
done
