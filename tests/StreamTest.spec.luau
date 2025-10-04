return function() 
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Types = require(script.Parent.Parent.Types)
    local Stream = require(script.Parent.Parent.Stream)

    describe("test if the Stream API", function() 
        
    it("can create streams", function() 
        expect(Stream.of({1,2,3})).to.be.ok()
    end)

    it("can create unique streams", function() 
        local list = {1,2,3}

        local stream1 = Stream.of(list)
        local stream2 = Stream.of(list)

        expect(stream1).never.to.be.equal(stream2)
    end)

    it("can create empty streams", function() 
        expect(#Stream.empty():collect()).to.be.equal(0)
    end)

    it("can filter elements", function() 
        local list = Stream.of({1,2,3,4,5})
            :filter(function(element) return element < 4 end)
            :collect()

        expect(unpack(list)).to.be.equal(unpack({1,2,3}))
    end)

    it("can count elements", function() 
        local count = Stream.of({1,2,3,4,5})
            :count()

        expect(count).to.be.equal(5)
    end)

    it("can find the first element", function() 
        local first = Stream.of({1,2,3,4,5})
            :findFirst()

        expect(first).to.be.equal(1)
    end)
    
    it("can sort small lists", function() 
        local list = Stream.of({1,5,4,1,3,2,1})
            :sorted(function(first, second) return first < second end)
            :collect()

        expect(unpack(list)).to.be.equal(unpack({1,1,1,2,3,4,5}))
    end)

    it("can sort larger lists", function() 
        local bigList = {14,2,28,12,5,20,29,23,10,
            8,11,22,1,16,3,13,27,18,15,
            30,25,4,19,7,26,9,17,6,21,24
        }

        local bigListSorted = {1,2,3,4,5,6,7,8,9,10,
            11,12,13,14,15,16,17,18,19,20,
            21,22,23,24,25,26,27,28,29,30
        }

        local list = Stream.of(bigList)
            :sorted(function(first, second) return first < second end)
            :collect()

        expect(unpack(list)).to.be.equal(unpack(bigListSorted))
    end)

    it("can map elements", function() 
        local people = {
            {name="Thabata", age=25},
            {name="Carol", age=35},
            {name="Bob", age=19},
        }
        local ages = Stream.of(people)
            :map(function(person) return person.age end)
            :sorted(function(first, second) return first > second end)
            :collect()

        expect(unpack(ages)).to.be.equal(unpack({35, 25, 19}))
    end)

    it("can do foreach operation", function() 
        local people = {
            {name="Thabata", age=25},
            {name="Carol", age=35},
            {name="Bob", age=19},
        }
        
        Stream.of(people)
            :sorted(function(first, second) return first.age > second.age end)
            :forEach(function(person) expect(person).to.be.ok() end)
    end)
end)
end