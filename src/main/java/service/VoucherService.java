/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import daoGuestCustomer.VoucherDao;
import model.Voucher;
/**
 *
 * @author Admin
 */
public class VoucherService {
    private static final double DEFAULT_DISCOUNT = 30.0;
    private VoucherDao voucherDao;

    public VoucherService() {
        this.voucherDao = new VoucherDao();
    }

    public Voucher getVoucherByCode(String code) {
        Voucher voucher = voucherDao.getVoucherByCode(code);
        if (voucher != null && voucher.isValid()) {
            voucher.setDiscount(DEFAULT_DISCOUNT);
        }
        return voucher;
    }
}
