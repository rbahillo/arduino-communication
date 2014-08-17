<%@ page import="com.domotic.Price" %>



<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'date', 'error')} required">
	<label for="date">
		<g:message code="price.date.label" default="Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="date" precision="day"  value="${priceInstance?.date}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: priceInstance, field: 'prices', 'error')} required">
	<label for="prices">
		<g:message code="price.prices.label" default="Prices" />
		<span class="required-indicator">*</span>
	</label>
	

</div>

