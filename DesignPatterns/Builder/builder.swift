// The product we want to build
class Computer {
    var cpu: String = ""
    var ram: Int = 0
    var storage: Int = 0
    var gpu: String?
    
    init() {}
    
    func specifications() -> String {
        var specs = "Computer Specifications: \n"
        specs += "CPU: \(cpu)\n"
        specs += "RAM: \(ram)GB\n"
        specs += "Storage: \(storage)GB\n"
        if let gpu = gpu {
            specs += "GPU: \(gpu)"
        }
        return specs
    }
}

protocol ComputerBuilder {
    func reset()
    func setCPU(_ cpu: String) -> ComputerBuilder
    func setRAM(_ ram: Int) -> ComputerBuilder
    func setStorage(_ storage: Int) -> ComputerBuilder
    func setGPU(_ gpu: String) -> ComputerBuilder
    func build() -> Computer
}

// Concrete builder implementing the construction steps
class GamingComputerBuilder: ComputerBuilder {
    private var computer = Computer()
    
    func reset() {
        computer = Computer()
    }
    
    func setCPU(_ cpu: String) -> ComputerBuilder {
        computer.cpu = cpu
        return self
    }
    
    func setRAM(_ ram: Int) -> ComputerBuilder {
        computer.ram = ram
        return self
    }
    
    func setStorage(_ storage: Int) -> ComputerBuilder {
        computer.storage = storage
        return self
    }
    
    func setGPU(_ gpu: String) -> ComputerBuilder {
        computer.gpu = gpu
        return self
    }
    
    func build() -> Computer {
        let result = computer
        reset()
        return result
    }
}

// Director class that defines the construction steps
class ComputerAssembler {
    private var builder: ComputerBuilder
    
    init(builder: ComputerBuilder) {
        self.builder = builder
    }
    
    func constructGamingPC() -> Computer {
        return builder
            .setCPU("M4 Pro")
            .setRAM(48)
            .setStorage(1000)
            .setGPU("Apple Sillicon")
            .build()
    }
    
    func constructOfficePC() -> Computer {
        return builder
            .setCPU("M4 MAX")
            .setRAM(32)
            .build()
    }
}

// Example usage
let builder = GamingComputerBuilder()
let assembler = ComputerAssembler(builder: builder)

let gamingPC = assembler.constructGamingPC()
print(gamingPC.specifications())

let officePC = assembler.constructOfficePC()
print(officePC.specifications())

let customPC = builder
    .setCPU("M1 PRO")
    .setRAM(16)
    .setStorage(4096)
    .setGPU("Apple Sillicon")
    .build()

print(customPC.specifications())
