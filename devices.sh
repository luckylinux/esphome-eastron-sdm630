#!/bin/bash

# Configurations
names=()
profiles=()
topic_prefixes=()

# Populate device list
# Note: a single ESP32 can read multiple SDM630 ! 
#       Just set the appropriate Modbus address for each Device !

# Garage SDM630 ESP32
names[0]="garage-a"
profiles[0]="garage"
topic_prefixes[0]="meters/garage-sdm630"

# Laundry Room SDM630 ESP32
names[1]="laundry-a"
profiles[1]="laundry"
topic_prefixes[1]="meters/laundry-sdm630"

# Get nzumber of devices
num=${#names[@]}
maxindex=$(($num - 1))
selected=$((-1))

while [[ $selected -gt $maxindex ]] || [[ $selected -lt 0 ]]
do
    for ((index=0;index<=$maxindex;index++))
    do
        name=${names[$index]}
        profile=${profiles[$index]}

        selection=$((index+1))
        echo -e "[${selection}]"
        echo -e "\t Hostname: ${name}"
        echo -e "\t Profile: ${profile}"
    done

    read -p "Enter desired configuration: " selection
    selected=$((selection-1))
    name=${names[$selected]}
    profile=${profiles[$selected]}
    topic_prefix=${topic_prefixes[$selected]}
done

# Determine entities prefix for names
entities_name_prefix="${name}-sdm630"

# Determine entities prefix for ids (cannot contain dashes or spaces)
entities_id_prefix=${name//"-"/"_"}
entities_id_prefix="${entities_id_prefix}_sdm630"


# Echo
echo "Hostname set to <${name}>"
echo "Profile is <${profile}>"
#echo "MQTT Topic Prefix: ${topic_prefix}"
echo "MQTT Topic: ${topic_prefix}"
