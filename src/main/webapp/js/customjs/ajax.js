$(document).ready(function() {
	var size = null
	var quantity = $('#quantity').val()
	window.getValue = function(radio) {
		if (radio.checked) {
			size = radio.value;
		}
	}
	window.assignValue = function(input) {
		quantity = input.value;
	}
	//code cart ajax
	window.addToCart = function(id, color) {
		$.ajax({
			url: 'api/cart/add?id=' + id + "&color=" + color + '&size=' + size + '&quantity=' + quantity,
			type: 'get',
			success: function(data) {
				$('#tag-cart').html($(data).find('#tag-cart').children())
				$('#listProd').html($(data).find('#listProd').children())
			}
		})
	}

	window.updateCart = function(id, quantity) {
		$.ajax({
			url: 'api/cart/update?id=' + id + '&quantity=' + quantity,
			type: 'get',
			success: function(data) {
				$('#tag-cart').html($(data).find('#tag-cart').children())
				$('#listProd').html($(data).find('#listProd').children())
			}
		})
	}

	window.removeCart = function(id) {
		$.ajax({
			url: 'api/cart/remove?id=' + id,
			type: 'get',
			success: function(data) {
				$('#tag-cart').html($(data).find('#tag-cart').children())
				$('#listProd').html($(data).find('#listProd').children())
			}
		})
	}

	window.removeAllCart = function() {
		$.ajax({
			url: 'api/cart/removeAll',
			type: 'get',
			success: function(data) {
				$('#tag-cart').html($(data).find('#tag-cart').children())
				$('#listProd').html($(data).find('#listProd').children())
			}
		})
	}
	//end cart
	//product detail impress img to change size and image
	window.detail=function(id,color){
        		$.ajax({
        			url: '/product?id='+id+'&color='+color,
        			type:'get',
        			success: function(data){
        				$('#detail').html($(data).find('#detail').children())
        			}
        		})
        	}
     //wish list
     window.addToWishList=function(prdid,usid){
		 $.ajax({
			 url:'api/wishlist/add?prdid='+prdid+'&usid='+usid,
			 type:'get',
			 success: function(data){
				 $('#tag-cart').html($(data).find('#tag-cart').children())
				 $('#wishlist').html($(data).find('#wishlist').children())
			 },
		 })
	 }
	 window.removeWishList=function(id){
		 $.ajax({
			 url:'api/wishlist/remove?id='+id,
			 type: 'get',
			 success: function(data){
				 $('#tag-cart').html($(data).find('#tag-cart').children())
				 $('#wishlist').html($(data).find('#wishlist').children())
			 }
		 })
	 }
	 //sort Product
	 window.sortProductField=function(pageNo,field,sortDir){
		 $.ajax({
			 url:'/index/product?page='+pageNo+'&sortField='+field+'&sortDir='+sortDir,
			 type: 'get',
			 success: function(data){
				 $('#listPrd').html($(data).find('#listPrd').children())			
			 }
		 })
	 }
	 
	  //sort Order
	  window.sortOrderField=function(status,pageNo,field,sortDir){
		 $.ajax({
			 url:'/index/order?status='+status+'&page='+pageNo+'&sortField='+field+'&sortDir='+sortDir,
			 type: 'get',
			 success: function(data){
				 $('#listOrd').html($(data).find('#listOrd').children())			
			 }
		 })
	 }
	 //sortUser
	 window.sortUserField=function(page,field,sortDir){
		 $.ajax({
			 url:'/index/user?page='+page+'&sortField='+field+'&sortDir='+sortDir,
			 type: 'get',
			 success: function(data){
				 $('#listUser').html($(data).find('#listUser').children())			
			 }
		 })
	 }
	 //sort Product List

	  window.sortPrdList=function(category,color,min,max,brand,page,field,sortDir){
		 $.ajax({
			 url:'/product-list?category='+category+'&color='+color+'&min='+min+'&max='+max+'&brand='+brand+'&page='+page+'&sortField='+field+'&sortDir='+sortDir,
			 type: 'get',
			 success: function(data){
				 $('#producList').html($(data).find('#producList').children())
				 $('#range').html($(data).find('#range').children())			
			 }
		 })
	 }
})