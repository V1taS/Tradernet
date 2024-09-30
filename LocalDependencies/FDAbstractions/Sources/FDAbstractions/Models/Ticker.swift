//
//  Ticker.swift
//  FDAbstractions
//
//  Created by Vitalii Sosin on 30.09.2024.
//

import Foundation

/// Перечисление доступных тикеров
/// Используется для указания тикеров, на которые нужно подписаться для получения котировок.
public enum Ticker: String, CaseIterable {
  case sp500 = "SP500.IDX"
  case aaplUS = "AAPL.US"
  case rsti = "RSTI"
  case gazp = "GAZP"
  case mrkz = "MRKZ"
  case rual = "RUAL"
  case hydr = "HYDR"
  case mrks = "MRKS"
  case sber = "SBER"
  case fees = "FEES"
  case tgka = "TGKA"
  case vtbr = "VTBR"
  case anhUS = "ANH.US"
  case viclUS = "VICL.US"
  case burgUS = "BURG.US"
  case nblUS = "NBL.US"
  case yetiUS = "YETI.US"
  case wsfsUS = "WSFS.US"
  case nioUS = "NIO.US"
  case dxcUS = "DXC.US"
  case micUS = "MIC.US"
  case hsbcUS = "HSBC.US"
  case expnEU = "EXPN.EU"
  case gskEU = "GSK.EU"
  case shpEU = "SHP.EU"
  case manEU = "MAN.EU"
  case db1EU = "DB1.EU"
  case muv2EU = "MUV2.EU"
  case tateEU = "TATE.EU"
  case kgfEU = "KGF.EU"
  case mggtEU = "MGGT.EU"
  case sggdEU = "SGGD.EU"
}
