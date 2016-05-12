def find_itinerary(tickets)
    itineraries = Hash.new { |k,v| k[v] = [] }
    reconstructed = ['JFK']
    last_dest = nil
    tickets.each do |source,destination|
        insert_and_sort(source,destination,itineraries)
    end
    (tickets.length - 1).times do
        if itineraries[reconstructed.last].empty?
            last_dest = itineraries[reconstructed.last].shift
        else
            reconstructed << itineraries[reconstructed.last].shift
        end
        p itineraries
    end
    reconstructed << last_dest
end

def insert_and_sort(source,destination,itineraries)
    if itineraries[source].empty?
        itineraries[source] << destination
    else
        itineraries[source].each_with_index do |existing_dest,i|
            if destination < existing_dest
                itineraries[source].insert(i,destination)
                return
            end
        end
        itineraries[source] << destination
    end
end

p find_itinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])
