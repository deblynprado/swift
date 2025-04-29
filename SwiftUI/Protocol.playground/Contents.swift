protocol HospitalDelegate {
    func cleanTools()
    func makeSurgery()
}

class Cardiologist : HospitalDelegate {
    func cleanTools() {
        print("Esterelizei Bistury")
    }
    
    func makeSurgery() {
        print("Estou em Cirurgia do Coração")
    }
}

class Obstetrician : HospitalDelegate {
    func cleanTools() {
        print("Limpei a paciente")
    }
    
    func makeSurgery() {
        print("Estou em um parto")
    }
}


//let medico = Cardiologist()
//medico.makeSurgery()
//medico.cleanTools()
//
//let doutor = Obstetrician()
//doutor.makeSurgery()
//doutor.cleanTools()


class Hospital {
    var delegate: HospitalDelegate?
    
    init(delegate : HospitalDelegate) {
        self.delegate = delegate
    }
    
    func makeSurgery() {
        delegate?.makeSurgery()
        
    }
}

let hospital = Hospital(delegate: Cardiologist())
hospital.makeSurgery()
