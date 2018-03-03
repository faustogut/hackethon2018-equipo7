pragma solidity ^0.4.16;


contract Universidad {
    
    struct DatosUniversidad {
        address idUniversidad;
        bytes32 nameUniversidad;
    }

    event SetCrearUniversidad(
        address idUniversidad, 
        bytes32 nameUniversidad,
        uint upDateUniversidadAt);
    
    mapping(address=> DatosUniversidad) public datosUniversidad;
    address public dniProfesional;
    //address[] public arrayDatosUniversidad;

    function crearUniversidad(address _idUniversidad, bytes32 _nameUniversidad) public {
        datosUniversidad[msg.sender].idUniversidad = _idUniversidad;
        datosUniversidad[msg.sender].nameUniversidad = _nameUniversidad;
       // arrayDatosUniversidad.push();
    }
    
    function getUniversidad(address _idUniversidad) public returns (bytes32) {
        return datosUniversidad[_idUniversidad].nameUniversidad;
    }
}
