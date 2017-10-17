while read line; do
  instance=$(echo $line | awk '{print $1}')
  if [ "$instance" != "instance" ]; then
    sol=$(cat ~/Code/ijcai2017-partitioning-common-subgraph/experiments/gpgnode-results/mcsplain/james-cpp-max/$instance.out | grep "Solution size" | awk '{print $3}')
    size=$(echo $instance | sed 's/.*_s\([0-9]*\)_.*/\1/')
    echo "scale=8; $sol / $size" | bc
  else
    echo "best_solution_size_over_instance_size"
  fi
done < runtimes.data > ratios.txt

paste runtimes.data ratios.txt > joined_data.txt
