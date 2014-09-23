package com.domotic

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(Price)
class PriceSpec extends Specification {

	def Price price = null;
    def setup() {
		price = new Price()
		def map = [19: 141.89,
,22
:137.89
,17
:136.77
,23
:131.51
,18
:138.52
,15
:133.65
,16
:134.7
,13
:141.98
,14
:137.7
,11
:143.16
,12
:142.99
,21
:153.94
,3
:119.66
,2
:118.56
,20
:148.04
,10
:141.23
,1
:120.85
,0
:130.2
,7
:139.57
,6
:127.81
,5
:121.44
,4
:121.19
,9
:140.95
,8
:136.84]
		price.prices=map;
    }

    def cleanup() {
    }

    void "test Price"() {
		this.price.allowOrange()
    }
}
