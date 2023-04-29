echo "Enter two numbers:"
read x
read y
echo "Choose an arithmetric operation (+, -, *, /):"
read operation
result=$(($x $operation $y))
echo "result:$result"
