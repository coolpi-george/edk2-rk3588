/** @file
 *
 *  USB 1.1 (OHCI) controllers.
 *
 *  Copyright (c) 2022, Rockchip Electronics Co., Ltd
 *  Copyright (c) 2023, Mario Bălănică <mariobalanica02@gmail.com>
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/

 #include "AcpiTables.h"

 Device (OHC0) {
   Name (_HID, "GEDU0810")//"PRP0001")
   Name (_CLS, Package() { 0x0c, 0x03, 0x10 })
   Name (_UID, Zero)
   Name (_CCA, Zero)
 
   Name (_DSD, Package () {
     ToUUID("C34163F1-CBA2-4252-BD58-69471AA0B042"),
     Package () {
       Package () { "compatible", "generic-ohci" },
     }
   })
 
   Method (_CRS, 0x0, Serialized) {
     Name (RBUF, ResourceTemplate() {
       Memory32Fixed (ReadWrite, 0xFC840000, 0x40000)
       Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 248 }
     })
     Return (RBUF)
   }
 
   Device (RHUB) {
     Name (_ADR, 0)
     Device (PRT1) {
       Name (_ADR, 1)
       Name (_UPC, Package() {
         0xFF,         // Port is connectable
         0x00,         // Connector type - Type 'A'
         0x00000000,   // Reserved, must be zero
         0x00000000    // Reserved, must be zero
       })
       Name (_PLD, Package (0x01) {
         ToPLD (
           PLD_Revision            = 0x2,
           PLD_IgnoreColor         = 0x1,
           PLD_UserVisible         = 0x1,
           PLD_Panel               = "UNKNOWN",
           PLD_VerticalPosition    = "UPPER",
           PLD_HorizontalPosition  = "LEFT",
           PLD_Shape               = "HORIZONTALRECTANGLE",
           PLD_Ejectable           = 0x1,
           PLD_EjectRequired       = 0x1,
         )
       })
     }
   }
 }
 
 Device (OHC1) {
   Name (_HID, "GEDU0810")
   Name (_CLS, Package() { 0x0c, 0x03, 0x10 })
   Name (_UID, One)
   Name (_CCA, Zero)
 
   Name (_DSD, Package () {
     ToUUID("2BA47C1A-111E-4ABB-8263-FCABFFAC69EA"),
     Package () {
       Package () { "compatible", "generic-ohci" },
     }
   })
 
   Method (_CRS, 0x0, Serialized) {
     Name (RBUF, ResourceTemplate() {
       Memory32Fixed (ReadWrite, 0xFC8C0000, 0x40000)
       Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 251 }
     })
     Return (RBUF)
   }
 
   Device (RHUB) {
     Name (_ADR, 0)
     Device (PRT1) {
       Name (_ADR, 1)
       Name (_UPC, Package() {
         0xFF,         // Port is connectable
         0x00,         // Connector type - Type 'A'
         0x00000000,   // Reserved, must be zero
         0x00000000    // Reserved, must be zero
       })
       Name (_PLD, Package (0x01) {
         ToPLD (
           PLD_Revision            = 0x2,
           PLD_IgnoreColor         = 0x1,
           PLD_UserVisible         = 0x1,
           PLD_Panel               = "UNKNOWN",
           PLD_VerticalPosition    = "LOWER",
           PLD_HorizontalPosition  = "LEFT",
           PLD_Shape               = "HORIZONTALRECTANGLE",
           PLD_Ejectable           = 0x1,
           PLD_EjectRequired       = 0x1,
         )
       })
     }
   }
 }
 
