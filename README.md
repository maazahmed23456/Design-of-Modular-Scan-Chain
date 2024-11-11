# Design-of-Modular-Scan-Chain
Repository related to my project work on designing a modular scan chain that allows functionality to pass inputs from one layer to another (3D)

This project is my final year major project and is still in development. This projects aims to perfrom layout of a SAR ADC and analyse and improve upon the performance prameters. Currently the prelayout design and simulation of Sample and Hold Circuit and Comparator are completed 

*Note: Circuit requires further improvents and integrations*


## A Glance at the Scab Chain 

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


## Block Diagram of the SAR ADC 

 <p align="center">
  <img width="800" height="500" src="/Images/block diagram.png">
</p>




## Circuit Diagram of the Sample and Hold Circuit

 <p align="center">
  <img width="800" height="500" src="/Images/Screenshot.png">
</p>

## Circuit Diagram of the Comparator Circuit

 <p align="center">
  <img width="800" height="500" src="/Images/2.png">
</p>
 <p align="center">
   <img width="800" height="500" src="/Images/1.png">
</p>


## Pre-Layout Simulation

###  Transient Analysis of Sample and Hold


 <p align="center">
  <img width="800" height="500" src="/Images/switch.png">
</p>


###  Transient Analysis of Comparator


 <p align="center">
  <img width="800" height="500" src="/Images/compagood.png">
</p>

**Note: Current without Inverter for Enable Logic**



***************



## Future Work

1. **Enhance SNDR and SFDR:** Use optimized capacitor sizing and layout to minimize mismatch, enhancing signal-to-noise distortion ratio (SNDR) and spurious free dynamic range (SFDR).

2. **Improve Effective Number of Bits (ENOB):** Design a high-precision, low-offset comparator to increase accuracy, contributing to a higher ENOB.

3. **Reduce Noise:** Implement low-noise reference and power supply management techniques to suppress noise contributions from external sources.

4. **Optimize Switching Energy:** Use advanced DAC switching techniques (e.g., split-capacitor switching) to minimize power consumption and switching noise, crucial for handling low-frequency ECG signals.

5. **Fabricate and Test with Real Signals:** Plan for IC fabrication and real-time testing with ECG signal acquisition to validate performance, ensuring reliable operation in medical applications.

## Contributors 

- **Maaz Ahmed** 
- **Krishna Mouli** 
- **Sandeep** 



## Acknowledgments


- Dr.Ediga Raghuveera , AdHoc Facukty , NIT AP (mentor)
- Dr.Kiran Kumar Gurrala , Assistant Professor , NIT AP
- Dr.Puli Kishore Kumar , Assistant Professor , NIT AP
- Harika Banala , PhD , NIT AP

## Contact Information

- Shaik Maaz Ahmed , maazahmed23456@gmail.com
