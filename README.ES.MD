# Conección entre Smart Contracts

Este proyecto demuestra diferentes patrones de interacción entre contratos inteligentes en Solidity, incluyendo validación de permisos, manejo de errores, contratos `payable` y comunicación a través de interfaces. Está diseñado como una base educativa y de referencia para desarrolladores que deseen aprender buenas prácticas en Ethereum.

---

## 📁 Estructura del Proyecto

CONNECTION-BETWEEN-SMART-CONTRACTS/
├── states/
│   └── vm-prague/                   
│       ├── state.json
│       └── artifacts/
├── checks/
│   └── checkTest.sol                 
├── peyablefunction/
│   ├── payablecontract2.sol           
│   └── peyablesmartcontract.sol       
├── SSConnect/                          
│   ├── checks/
│   │   └── checkTest.sol               
│   ├── interface/
│   │   └── IResult.sol                  
│   ├── validators/
│   │   ├── result.sol                    
│   │   └── sum.sol                        
├── LICENSE                              
└── README.md

---

## ⚙️ Contratos Inteligentes

### 1. `RequireTest` (múltiples versiones)
Ilustra tres formas de verificar que el remitente (`msg.sender`) sea el administrador:
- **`checkAdmin`**: usa `if (msg.sender != admin) revert();` sin mensaje.
- **`checkAdminRequire`**: emplea `require` con un código de error (`"01"`).
- **`adminCheckCustomErrors`**: utiliza un error personalizado (`SenderNotAdmin`).

Estos ejemplos muestran cómo gestionar el control de acceso y optimizar el consumo de gas.

### 2. `PayableContractV2` y `PeyableContract`
- **`sendEther`**: función `payable` que permite al contrato recibir Ether.
- **`withDrawEther`**: retira una cantidad específica de Ether hacia el remitente mediante `call`.

Ambos contratos sirven como base para manejar fondos dentro de un contrato.

### 3. `IResult` (Interfaz)
Define las funciones que debe implementar un contrato compatible:
- `addition(uint256 num1_, uint256 num2_)`
- `setResult(uint256 num_)`
- `setFee(uint256 newFee_)`

### 4. `Result`
Almacena:
- `result`: resultado de una operación.
- `admin`: dirección del administrador (asignada en el constructor).
- `fee`: tarifa (inicializada en 3).

**Funciones principales:**
- `setResult(uint256 num_)`: actualiza el resultado (sin restricción de acceso).
- `setFee(uint256 newfee_)`: solo el administrador puede modificar la tarifa.

### 5. `Sum`
Contrato que interactúa con una dirección de `Result` (inyectada en el constructor).
- **`addition`**: calcula la suma de dos números y llama a `setResult` del contrato `Result`.
- **`setFee`**: invoca `setFee` en el contrato `Result` para actualizar la tarifa.

Este ejemplo muestra cómo un contrato puede llamar a funciones de otro contrato a través de una interfaz.

---

## 🔗 Interacción entre Contratos

El flujo principal se da entre `Sum` y `Result`:
1. Se despliega primero `Result` (con una dirección admin).
2. Se despliega `Sum` pasando la dirección de `Result`.
3. Al llamar a `Sum.addition(5,3)`, este contrato calcula `8` y ejecuta `IResult(result).setResult(8)`, actualizando el estado en `Result`.
4. De manera similar, `Sum.setFee(10)` modifica la tarifa en `Result`, siempre que el remitente sea el admin.

---

## 🚀 Despliegue y Pruebas

### Requisitos
- Compilador Solidity `0.8.30`.
- Herramientas como Hardhat, Foundry o Truffle.
