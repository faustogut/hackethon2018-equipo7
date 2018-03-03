pragma solidity ^0.4.16;


contract EmpresaConsulta {
    struct Empresa {
        bytes32 empCIF; 
        bytes32 nombre;  
    }

     // This is a namespace where we will store EmpresaConsulta
    mapping(bytes32 => Empresa) public empresas;
 
 // Set values in storage
    function storeEmpresa(bytes32 key, bytes32 _empCIF, bytes32 _nombre) returns (bool success) {
        empresas[key].empCIF = _empCIF;
        empresas[key].nombre = _nombre;
        return true;
    }
}


contract Otra {

    EmpresaConsulta empresaconsulta;

  // Define the Type in this context
    struct Empresa {
        bytes32 empCIF; 
        bytes32 nombre;  
    }    

  // For this to work, pass in D's address to E's constructor
    function extraer(address empresaDir) {
        empresaconsulta = EmpresaConsulta(empresaDir);
    }

    function retrieveData(bytes32 key) 
    public
    constant
    returns(bytes32, bytes32) 
    {
    // Declare a temporary "doc" to hold a DocumentStruct
        Empresa memory doc;
    // Get it from the "public" mapping's free getter.
        (doc.empCIF, doc.nombre) = empresaconsulta.empresas(key);
        
    // return values with a fixed sized layout
        return (doc.empCIF, doc.nombre);
    }

}
