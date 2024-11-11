# Design-of-Modular-Scan-Chain
Repository related to my project work on designing a modular scan chain that allows functionality to pass inputs from one layer to another (3D)

This project is my final year major project and is still in development. This projects aims to perfrom layout of a SAR ADC and analyse and improve upon the performance prameters. Currently the prelayout design and simulation of Sample and Hold Circuit and Comparator are completed 

*Note: Circuit requires further improvents and integrations*


## A Glance at the Scan Chain 

This modular scan chain design enhances the testability and reliability of multi-die and 3D IC architectures by incorporating selective test access, TSV (Through-Silicon Via) support, and efficient data handling. The `test_access_en` signal allows isolated scan testing of individual dies, while TSV connections facilitate inter-die communication. TSV integrity is verified by comparing the TSV input (`tsv_in`) with the scan chain’s output, with the test outcome stored in `tsv_test_result`. Controlled by the `tsv_test_en` signal, this feature ensures reliable data transfer across dies. The scan chain, implemented using flip-flops, efficiently shifts data during testing, with a reset feature for proper initialization. This design optimizes fault detection, inter-die connectivity, and modular testing in complex IC systems.

- clk: Clock signal – triggers operations in the scan chain.
- rst_n: Reset signal – initializes the scan chain state.
- scan_in: Scan input – data entry point for the scan chain.
- scan_en: Scan enable – activates the scan chain operation.
- test_access_en: Test access enable – enables modular testing.
- tsv_test_en: TSV test enable – initiates TSV test logic.
- tsv_in: TSV input – receives data from another die.
- scan_out: Scan output – outputs data from the scan chain.
- tsv_out: TSV output – sends data to the next die.
- tsv_pass: TSV test result – indicates TSV integrity.


## Synthesized View 

 <p align="center">
  <img width="800" height="500" src="/MODULAR SCAN CHAIN/SCHEMATIC.png">
</p>


## Simulation

###  Functionality


 <p align="center">
  <img width="800" height="500" src="/MODULAR SCAN CHAIN/SIMULATION WAVEFORM.png">
</p>


***************



## Future Work

1. **Power Optimization**: Implement power-saving techniques like clock gating or adaptive voltage scaling to reduce power consumption during testing, especially for energy-constrained applications like wearable or implantable devices.

2. **Error Detection and Correction**: Integrate error correction codes or redundancy mechanisms within the scan chain and TSV paths to improve reliability, particularly in environments where inter-die connections are prone to faults.

3. **Scalability for Higher Data Rates**: Enhance the design to support higher data rates and bandwidth for TSVs, accommodating future advancements in high-speed multi-die communication in 3D ICs.

4. **Built-In Self-Test (BIST) Integration**: Develop a Built-In Self-Test (BIST) mechanism to make the scan chain more autonomous, reducing the need for external test equipment and enabling more efficient, on-chip fault diagnosis and repair.

## Contributors 

- **Maaz Ahmed**  


## Acknowledgments

- Dr.Ediga Raghuveera , AdHoc Facukty , NIT AP (mentor)
- Dr.Kiran Kumar Gurrala , Assistant Professor , NIT AP
- Dr.Puli Kishore Kumar , Assistant Professor , NIT AP
- Harika Banala , PhD , NIT AP

## Contact Information

- Shaik Maaz Ahmed , maazahmed23456@gmail.com
