//
//  PDFLineSeparatorObject_Spec.swift
//  TPPDF_Tests
//
//  Created by Philip Niedertscheider on 12/11/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import TPPDF

class PDFLineSeparatorObject_Spec: QuickSpec {

    override func spec() {
        describe("PDFLineSeparatorObject") {

            var separator: PDFLineSeparatorObject! = PDFLineSeparatorObject()

            context("variables") {

                it("has a line style") {
                    expect(separator.style).toNot(beNil())
                }
            }

            context("initalizers") {

                it("can be initalized without") {
                    separator = PDFLineSeparatorObject()
                    expect(separator).toNot(beNil())
                }

                it("can be initalized with a line style") {
                    let style = PDFLineStyle(type: .dotted, color: .orange, width: 0.25)

                    separator = PDFLineSeparatorObject(style: style)

                    expect(separator.style) == style
                }
            }

            context("calculation") {
                let document = PDFDocument(format: .a4)
                let generator = PDFGenerator(document: document)
                var container = PDFContainer.headerLeft

                it("works for container headerLeft") {
                    container = PDFContainer.headerLeft

                    let result = try? separator.calculate(generator: generator, container: container)

                    expect(result?.first?.0) == container
                    expect(result?.first?.1 as? PDFLineSeparatorObject) === separator
                    expect(separator.frame) == CGRect(x: 60, y: 60, width: 475, height: separator.style.width)
                }
            }
        }
    }
}

