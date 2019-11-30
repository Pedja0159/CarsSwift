//
//  Protocols.swift
//  Automobili2
//
//  Created by Pejo on 26/11/2019.
//  Copyright © 2019 pejo015. All rights reserved.
//

import Foundation



protocol CarCellDelegate {
    func presentInfoView(withPokemonViewModel carViewModel: CarViewModel)
    func viewMoreInfo(withViewModel carViewModel: CarViewModel?)
}
