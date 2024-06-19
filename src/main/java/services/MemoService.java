package services;

import java.time.LocalDateTime;
import java.util.List;

import actions.views.EmployeeConverter;
import actions.views.EmployeeView;
import actions.views.MemoConverter;
import actions.views.MemoView;
import constants.JpaConst;
import models.Memo;
import models.validators.MemoValidator;

/**
 * メモテーブルの操作に関わる処理を行うクラス
 */
public class MemoService extends ServiceBase {

    /**
     * 指定した従業員が作成したメモデータを、指定されたページ数の一覧画面に表示する分取得しMemoViewのリストで返却する
     * @param employee 従業員
     * @param page ページ数
     * @return 一覧画面に表示するデータのリスト
     */
    public List<MemoView> getMinePerPage(EmployeeView employee, int page) {

        List<Memo> memos = em.createNamedQuery(JpaConst.Q_MEMO_GET_ALL_MINE, Memo.class)
                .setParameter(JpaConst.JPQL_PARM_EMPLOYEE, EmployeeConverter.toModel(employee))
                .setFirstResult(JpaConst.ROW_PER_PAGE * (page - 1))
                .setMaxResults(JpaConst.ROW_PER_PAGE)
                .getResultList();
        return MemoConverter.toViewList(memos);
    }

    /**
     * 指定した従業員が作成したメモデータの件数を取得し、返却する
     * @param employee
     * @return メモデータの件数
     */
    public long countAllMine(EmployeeView employee) {

        long count = (long) em.createNamedQuery(JpaConst.Q_MEMO_COUNT_ALL_MINE, Long.class)
                .setParameter(JpaConst.JPQL_PARM_EMPLOYEE, EmployeeConverter.toModel(employee))
                .getSingleResult();

        return count;
    }

    /**
     * 指定されたページ数の一覧画面に表示するメモデータを取得し、MemoViewのリストで返却する
     * @param page ページ数
     * @return 一覧画面に表示するデータのリスト
     */
    public List<MemoView> getAllPerPage(int page) {

        List<Memo> memos = em.createNamedQuery(JpaConst.Q_MEMO_GET_ALL, Memo.class)
                .setFirstResult(JpaConst.ROW_PER_PAGE * (page - 1))
                .setMaxResults(JpaConst.ROW_PER_PAGE)
                .getResultList();
        return MemoConverter.toViewList(memos);
    }

    /**
     * メモテーブルのデータの件数を取得し、返却する
     * @return データの件数
     */
    public long countAll() {
        long memos_count = (long) em.createNamedQuery(JpaConst.Q_MEMO_COUNT, Long.class)
                .getSingleResult();
        return memos_count;
    }

    /**
     * idを条件に取得したデータをMemoViewのインスタンスで返却する
     * @param id
     * @return 取得データのインスタンス
     */
    public MemoView findOne(int id) {
        return MemoConverter.toView(findOneInternal(id));
    }

    /**
     * 画面から入力された日報の登録内容を元にデータを1件作成し、メモテーブルに登録する
     * @param mv メモの登録内容
     * @return バリデーションで発生したエラーのリスト
     */
    public List<String> create(MemoView mv) {
        List<String> errors = MemoValidator.validate(mv);
        if (errors.size() == 0) {
            LocalDateTime ldt = LocalDateTime.now();
            mv.setCreatedAt(ldt);
            mv.setUpdatedAt(ldt);
            createInternal(mv);
        }

        //バリデーションで発生したエラーを返却（エラーがなければ0件の空リスト）
        return errors;
    }

    /**
     * 画面から入力されたメモの登録内容を元に、メモデータを更新する
     * @param rv メモの更新内容
     * @return バリデーションで発生したエラーのリスト
     */
    public List<String> update(MemoView mv) {

        //バリデーションを行う
        List<String> errors = MemoValidator.validate(mv);

        if (errors.size() == 0) {

            //更新日時を現在時刻に設定
            LocalDateTime ldt = LocalDateTime.now();
            mv.setUpdatedAt(ldt);

            updateInternal(mv);
        }

        //バリデーションで発生したエラーを返却（エラーがなければ0件の空リスト）
        return errors;
    }

    /**
     * idを条件にデータを1件取得する
     * @param id
     * @return 取得データのインスタンス
     */
    private Memo findOneInternal(int id) {
        return em.find(Memo.class, id);
    }

    /**
     * メモデータを1件登録する
     * @param mv メモデータ
     */
    private void createInternal(MemoView mv) {

        em.getTransaction().begin();
        em.persist(MemoConverter.toModel(mv));
        em.getTransaction().commit();

    }

    /**
     * メモデータを更新する
     * @param mv メモデータ
     */
    private void updateInternal(MemoView mv) {

        em.getTransaction().begin();
        Memo m = findOneInternal(mv.getId());
        MemoConverter.copyViewToModel(m, mv);
        em.getTransaction().commit();

    }

}