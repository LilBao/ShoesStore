<form>
	<textarea id="invoice" rows="" cols="">
	<div class="container mb-5">
	<div class="row d-flex justify-content-center">
		<div class="col-md-8">
			<div class="x`card">
				<div class="invoice">
					<div
								class="payment border-top mt-3 mb-3 border-bottom table-responsive">
						<table class="table table-borderless">
							<tbody>
								<th>Thông tin khách hàng</th>
								<tr>
									<td colspan="2">
										<div class="">
											<span class="d-block font-weight-bold">Địa chỉ giao
												hàng</span> <span class="d-block">${ord.fullname}</span> <span
														class="d-block">${ord.address}</span>
										</div>
									</td>
									<td colspan="2">
										<div class="py-2">
											<span class="d-block font-weight-bold">Địa chỉ thanh
												toán</span> <span class="d-block">${ord.users.fullname}</span> <span
														class="d-block">${ord.address}</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div
								class="payment border-top mt-3 mb-3 border-bottom table-responsive">
						<table class="table table-borderless">
							<thead>
								<th colspan="2">Thông tin đơn hàng</th>
							</thead>
							<tbody>
								<tr>
									<td>
										<div class="py-2">
											<span class="d-block font-weight-bold">Order Date</span> <span>${ord.createdate}</span>
										</div>
									</td>
									<td>
										<div class="py-2">
											<span class="d-block font-weight-bold">Order No</span> <span>#${ord.id}</span>
										</div>
									</td>
									<td>
										<div class="py-2">
											<span class="d-block font-weight-bold">Payment</span>

										</div>
									</td>
									<td>
										<div class="py-2">
											<span class="d-block font-weight-bold">Shiping Address</span>
											<span>${ord.address}</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="product border-bottom table-responsive">
						<table class="table table-borderless text-left">
							<tbody>
								<c:forEach var="ordt" items="${ord.orderdt }">
									<tr>
										<td width="20%"><img
													src="${pageContext.request.contextPath }/img/${ordt.img}"
													width="90"></td>
										<td width="60%"><span class="font-weight-bold">${ordt.products.name}</span>
											<div class="product-qty"
														style="font-size: 12px; color: black">
												<span class="d-block">Quantity:${ordt.quantity }</span> <span>Color:${ordt.color}</span>
												<div>
													<span>Size:${ordt.size}</span>
												</div>
											</div></td>
										<td width="20%">
											<div class="text-right">
												<span class="font-weight-bold">$${ordt.price}</span>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="row d-flex justify-content-end">
						<div class="col-md-5">
							<table class="table table-borderless">
								<tbody class="totals">
									<tr>
										<td>
											<div class="text-left">
												<span class="text-muted">Subtotal</span>
											</div>
										</td>
										<td>
											<div class="text-right">
												<span>$${ord.totalprice }</span>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="text-left">
												<span class="text-muted">Shipping Fee</span>
											</div>
										</td>
										<td>
											<div class="text-right">
												<span>$0</span>
											</div>
										</td>
									</tr>
									<tr class="border-top border-bottom">
										<td>
											<div class="text-left">
												<span class="font-weight-bold">Total price</span>
											</div>
										</td>
										<td>
											<div class="text-right">
												<span class="font-weight-bold">$${ord.totalprice}</span>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	</textarea>
</form>
